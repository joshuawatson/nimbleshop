## Paypal website payments standard ##

endprologue.

Paypal offers a lot of products. nimbleShop has built-in support for [Paypal website payments standard] [1]. Paypal website payments standard has following attractive features:

* Buyer can pay using their Paypal account or they can pay using their credit card.
* Buyer does not need to have Paypal account in order to pay with his/her credit card. This feature is very compelling. It means users who do not have a Paypal account can make a payment using their credit card.
* There is no setup fee.
* There is no monthly fee.


### Using the Paypal sandbox ###

We do not need to have a real Paypal account to test . We are going to use <ins>Paypal sandbox</ins>.

#### Signup at Paypal sandbox ####

First step is signing up at [https://developer.paypal.com][2]. Paypal will send a confirmation link to validate your email address. Go signup and confirm the email address before moving to the next step.

#### Create test accounts ####

Visit [https://developer.paypal.com][2] and login.

Click on <ins>create a preconfigured account</ins> link .

![Paypal][3]

Lets create an account for buyer.

![Create Sandbox][4]

After the buyer account has been created you will see page like this

![Test Accounts][5]

Notice that even though I had typed the buyer email address as <ins>buyer@mailinator.com</ins> Paypal change the email address to <ins>buyer_1341965839_per@mailinator.com</ins>. This is normal and do not worry about it.

Next lets create a seller account. Click on <ins>Home</ins> to come back to homepage and then click on <ins>Create a preconfigured account</ins> link.

Enter all the information for seller. Make sure to select third radio button which is meant for seller.

![Configure Test Accounts][6]

After the seller account has been created the page will look like this

![Final Test Accounts][7]


Again even though I entered seller email address as <ins>seller@mailinator.com</ins> the email address was changed to <ins>seller_1341966113_biz@mailinator.com</ins>. That is okay and do not worry about it.

### Use forward ###

Paypal sends a callback and Paypal can't send callback to
<ins>localhost:3000</ins>. So you need a way to expose your application that is
running on local port <ins>3000</ins> to have a public name. You can use any tool
you want. I prefer to use [https://forwardhq.com/][8]
.

Once you have the url then open <ins>config/nimbleshop.yml</ins> and replace the
value for the key <ins>localhost2public_url</ins>.

### Configure nimbleShop to use seller email ###

* Visit [Admin tab Payment methods][9].
* Click the 'Paypal' vertical tab
* Update <ins>Merchant email</ins> with seller email address that you got. I am going to enter <ins>seller_1341966113_biz@mailinator.com</ins>.
* Save the record.

### Instant payment notification in Paypal ###

Now lets go and buy something. At the payment page select <ins>Paypal</ins> radio button.

You will be taken to a page. Enter the buyer email address. I am going to enter <ins>buyer_1341965839_per@mailinator.com</ins> and password <ins>welcome1</ins>. Hit Submit.

In the next page select the checkbox and click <ins>Agree and Continue</ins>.

![Agreement][10]

In the next page click on 'Pay Now'.

![Pay Now][11]

If everything goes fine then you should see this page

![Payment Complete][12]


### Verify payment at papal account page ###

Now lets confirm the payment by visiting the account page at Paypal.

Come back to the and the page should look like this

![Sandbox2][13]

Click on 'Enter Sandbox Test Site'. That should open a popup  Here you should see a transaction record for the amount you paid. This is what I see.

![Completed Test][14]

#### Paypal order management integration guide ####

Here is the [Paypal order management integration guide][15].

[1]: https://merchant.paypal.com/us/cgi-bin/?cmd=_render-content&content_ID=merchant/wp_standard
[2]: https://developer.paypal.com
[3]: https://img.skitch.com/20120711-rqfg9sfehy3wfjcr162eih3twp.jpg
[4]: https://img.skitch.com/20120711-8fesn7eksjmgyyjb5tssy6r99k.jpg
[5]: https://img.skitch.com/20120711-pqbjbdu8uyfmwyj7sprpbkktbp.jpg
[6]: https://img.skitch.com/20120711-jbyk89g6jwuiceak2qghfus31e.jpg
[7]: https://img.skitch.com/20120711-1fui4ars8a4rxb8errw7a3sy3e.jpg
[8]: https://forwardhq.com
[9]: http://localhost:3000/admin/payment_methods
[10]: https://img.skitch.com/20120711-xjx48pfukmwi77aq5ymci5rufj.jpg
[11]: https://img.skitch.com/20120711-dwf4f7wyun415ydkdytasjyd2e.jpg
[12]: https://img.skitch.com/20120711-c5tb5w1gnfrq77m9kicn3p2hax.jpg
[13]: https://img.skitch.com/20120711-jpymjnqs3y4ffcyy9tpaawq1ww.jpg
[14]: https://img.skitch.com/20120711-fh7na2td2dm6m53kc33rsqqgu9.jpg
[15]: https://cms.paypal.com/cms_content/en_US/files/developer/PP_OrderMgmt_IntegrationGuide.pdf