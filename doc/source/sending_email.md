##	Sending email ##

### Notification to buyer and seller ###

When a buyer buys an item then buyer is sent an email detailing the purchase details. Seller is also notified that purchase has been made.

Sending email is a time consuming process and hence it is best to handle sending email through a background processing job. <ins>nimbleShop</ins> comes with [delayed job][1] which handles background job processing. So the emails are not sent out immediately. Rather emails are written to the database. And you need to execute following command to actually deliver the email.

```shell
rake jobs:work
```

### mailtrap for testing out email ###

When the application is still being developed you do not want emails to go out for real. But you will want to preview the email. Open <ins>config/nimbleshop.yml</ins> and you will see a key named <ins>deliver_email</ins>. The default value of this key is <ins>false</ins> in <ins>development</ins> and <ins>test</ins>.  Change the value to suit your needs.

In order to make it easy to preview emails <ins>nimbleShop</ins> uses [mailtrap.io][2]  You can signup for your own account but nimbleShop comes with a valid <ins>mailtrap</ins> account. Login at [mailtrap.io][2] with email <ins>bot.nimbleshop@gmail.com</ins> and password <ins>64arecKhX23giAfw</ins>. If you are not able to login then that means someone has changed then password. In that case signup at <ins>mailtrap.io</ins>, create a new inbox and enter the <ins>mailtrap</ins> credentials at <ins>config/nimbleshop.yml</ins>.

Now start the rails application. Buy something. I usually just click on <ins>cash on delivery</ins> to make a quick buy. Then execute following command

```shell
rake jobs:work
```

You should see two emails at <ins>mailtrap.io</ins>.

### Configuring setup_email ###

If you want to send the email for real then you can plug in your email service provider related code at <ins>config/initializers/setup_email.rb</ins>.

[1]: https://github.com/collectiveidea/delayed_job
[2]: http://mailtrap.io