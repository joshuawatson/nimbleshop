## Running tests ##

### Running tests ###

nimbleShop uses testing framework provided by Ruby on Rails. If you are not familiar with testing philosophy of Rails then you should read [this excellent guide][1].

In order to run all the tests follow the steps given below

```shell
git clone git://github.com/nimbleshop/nimbleshop.git
cd nimbleshop
cd nimbleshop_core
rake
```

### How to run a single test ###

If you want to run tests for one single file then execute following command

```shell
cd nimbleshop_core
bundle exec ruby -I test  test/unit/product_test.rb
```

### save_and_open_page ###

In acceptance test if you need to look at the contents of the page then you can do so by having

```ruby
fill_in 'Price', with: 'wrong price'
click_button 'Submit'
save_and_open_page
```

### Installing firefox for selenium tests ###


nimbleShop uses selenium for acceptance tests. I found that firefox 11 does not play well with selenium. So here are the steps to follow to get selenium tests running on your machine

* If you are using Firefox 11 then uninstall it.
* Download (but do not install) Firefox 10 from [here][2].
* Now turn off internet connection.
* Install Firefox 10.
* Open Firefox and go to preferences > Advanced > Update. Check the radio button "Never check for updates". Close preference panel.
* Turn internet on.
* Now run tests for selenium.

[1]: http://guides.rubyonrails.org/testing.html
[2]: http://dl.dropbox.com/u/7468116/Firefox%2010.0.dmg
