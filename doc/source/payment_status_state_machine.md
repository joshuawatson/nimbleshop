## Payment status machine ##

### nimbleShop uses state machine to manage payment status ###

nimbleShop uses [state machine][1] to manage payment status. The readme of this project is very extensive so read it to better understand what "state machine" does.

### State machine in nimbleShop ###

nimbleShop has following code in `order.rb`.

```shell
state_machine :payment_status, initial: :abandoned do
	
	event(:authorize)	{ transition abondoned: :authorized	}
	event(:pending)		{ transition abondoned: :pending	}
	event(:kapture)		{ transition abondoned: :purchased	}
	event(:refund)		{ transition abondoned: :refunded	}
		
	event(:purchase)	{ transition [:abondoned,	:pending] =>	:purchased	}
	event(:void)		{ transition [:authorized,	:pending] =>	:voided	}
		
	state all - [ :abonded ] do 
		validates :payment_method, presence: true
	end
end
```

### Payment status related activities ###

Let's say that we have an order instance. You can inquire that order about the payment status in two different ways.


* Inquiring about current payment status

```shell
> order.payment_status
=> "abandoned"

> order.payment_status_name 
=> :abandoned

> order.human_payment-status_name
=> "abandoned"
```

* First way of inquiring if order belongs to a given state

```shell
> order.purchased?
=> false

> order.authorized?
=> false

> order.abandoned?
=> true
```

* Second way of inquiring if order belongs to a given state

```shell
> order.payment_status?(:abandoned)
=> true

> order.payment_status?(:purchased)
=> false
```

We can ask the `order` to what all other states it can go by individually asking for a given event name.

```shell
order.can_purchase?
=> true

> order.can_void?
=> false
```

Or we can ask `order` what all possible events that it can act upon in its current state.

```shell
> order.payment_status_events
=> [:authorize, :pending. :purchase]
```
* After being acted on events listed above the order can go into the following state

```shell
> order.payment_status_paths.to_states
=> [:authorized, :purchase, :refunded, :voided, :pending]


> order.payment_status_paths
=> [[#<StateMachine::Transition attribute=:payment_status event=:authorize from="abandoned" from_name=:abandoned to="authorized" to_name=:authorized>, #<StateMachine::Transition attribute=:payment_status event=:kapture from="authorized" from_name=:authorized to="purchased" to_name=:purchased>, #<StateMachine::Transition attribute=:payment_status event=:refund from="purchased" from_name=:purchased to="refunded" to_name=:refunded>], [#<StateMachine::Transition attribute=:payment_status event=:authorize from="abandoned" from_name=:abandoned to="authorized" to_name=:authorized>, #<StateMachine::Transition attribute=:payment_status event=:void from="authorized" from_name=:authorized to="voided" to_name=:voided>], [#<StateMachine::Transition attribute=:payment_status event=:pending from="abandoned" from_name=:abandoned to="pending" to_name=:pending>, #<StateMachine::Transition attribute=:payment_status event=:purchase from="pending" from_name=:pending to="purchased" to_name=:purchased>, #<StateMachine::Transition attribute=:payment_status event=:refund from="purchased" from_name=:purchased to="refunded" to_name=:refunded>], [#<StateMachine::Transition attribute=:payment_status event=:pending from="abandoned" from_name=:abandoned to="pending" to_name=:pending>, #<StateMachine::Transition attribute=:payment_status event=:void from="pending" from_name=:pending to="voided" to_name=:voided>], [#<StateMachine::Transition attribute=:payment_status event=:purchase from="abandoned" from_name=:abandoned to="purchased" to_name=:purchased>, #<StateMachine::Transition attribute=:payment_status event=:refund from="purchased" from_name=:purchased to="refunded" to_name=:refunded>]]

```

### Transitioning to a different state ###

If  the transtion to a different state fails then the method returns `false`.

```shell
> order.void
=> false

> order.authorize
=> false
```

The bang version raises an exception.

```shell
> order.void!
StateMachine::InvalidTransition: Cannot transition payment_status via :void from :abandoned (Reason(s): Payment status cannot transition via "void")

> order.authorize!
StateMachine::InvalidTransition: Cannot transition payment_status via :authorize from :purchased (Reason(s): Payment status cannot transition via "authorize")
```

### Before and after transition callback ###

state machine also provides before and after transitions callbacks as shown below.

```ruby
before_purchase(order, transition)
before_authorize(order, transition)
before_void(order, transition)

after_purchase(order, transition)
after_authorize(order, transition)
after_void(order, transition)
```
[1]: https://github.com/pluginaweek/state_machine
