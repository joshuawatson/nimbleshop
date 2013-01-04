## Authorize.net ##

[Authorize.net][1] is a payment gateway service provider allowing merchants to accept credit card and electronic checks payments. [Authorize.net][1] claims a user base of over 305,000 merchants, which would make them the Internet's largest payment gateway service provider.

### Sandbox account ###

Authorize.net provides [sandbox account][2] which can be used to test the application before the application goes live. nimbleShop comes with Authorize.net sandbox account credentials so you do not have to get your own sandbox account. However if you want to login at Authorize.net and see the transaction details for yourself then you should get your own sandbox account.

Follow the instructions given below to get your Authorize.net sandbox account.

#### Sign up at development center ####

Visit [Authorize.net development center][2] and sign up.
Make sure to select <ins>account type</ins> as <ins>Card Not Present</ins>.

![Sign Up][3]

#### API Credentials ####

After signing up you will see <ins>API Credentials</ins> which might look  like this.

![API][4]

#### Update nimbleShop to use the new Authorize.net credentials ####

* Visit [Admin tab Payment methods][5] .
* Update <ins>Api Login Id</ins> and <ins>Transaction Key</ins>.

### Paying using Credit card ###

Now that <ins>Authorize.net</ins> has been setup with new <ins>API Credentials</ins> lets try to checkout something using Authorize.net .

Start the <ins>myshop</ins> application and add a few items to the cart. Start the checkout process. When you come to payment page then enter credit card number. However do not enter real credit card number. We are still in the test mode. So use the credit card numbers mentioned in the next step.

#### Valid credit card numbers in sandbox ####

During the test mode actual credit card numbers are declined. This is to
prevent users from actually being charged when it was just meant for testing. In the test mode use following credit card numbers.


<table>
<tbody>
<tr class="odd">
<td align="left">Credit card type</td>
<td align="left">Number</td>
</tr>
<tr class="even">
<td align="left">Visa</td>
<td align="left">4007000000027</td>
</tr>
<tr class="odd">
<td align="left">Second Visa card</td>
<td align="left">4012888818888</td>
</tr>
<tr class="even">
<td align="left">American Express</td>
<td align="left">370000000000002</td>
</tr>
<tr class="odd">
<td align="left">Discover</td>
<td align="left">6011000000000012</td>
</tr>
<tr class="even">
<td align="left">JCB</td>
<td align="left">3088000000000017</td>
</tr>
<tr class="odd">
<td align="left">Diners Club/ Carte Blanche</td>
<td align="left">38000000000006</td>
</tr>
</tbody>
</table>

* Expiration date must be set to the present day or later.
* Security code for American express must be 4 digits. For all others use 3 digits.

#### Authorized transaction detail at Authorize.net ####

In the previous step we successfully paid using the credit card number given in the last step.  The default behavior of nimbleShop is to only <ins>Authorize</ins> the credit card.  If you do not fully understand the difference between <ins>authorize</ins> and <ins>capture</ins> then I highly recommend you to [read this ebook][6].

Lets look at this transaction details at Authorize.net .

* Visit [https://test.authorize.net][7] and login with valid credentials.
* Click on <ins>Unsettled Transactions</ins> to see transaction details.

![Authorize.net][8]
* You should see a transaction record which says <ins>Authorized</ins>.

![Payments][9]


#### Capturing the transaction ####

Next step is capturing the transaction.

* Visit [admin section].
* Click on <ins>Orders</ins> tab.
* Click on the first order in the list.
* Now you should see <ins>Capture payment</ins> in green. Just click on that and you should see label <ins>PURCHASED</ins> next to <ins>Payment status</ins>.

That means you have successfully charged the buyer's credit card.

#### Checking transactions in sandbox account ####

Lets verify that the transaction that we just captured is indeed showing as <ins>captured</ins> in Authorize.net admin panel.


* Visit [https://test.authorize.net][11] and login with valid credentials.
* Click on <ins>Unsettled Transactions</ins> to see transaction details.

![Unsettled trans][12]
* You should see a transaction record which says <ins>Captured</ins>.

![captured][13]

[1]: http://www.authorize.net
[2]: https://developer.authorize.net/testaccount
[3]: https://img.skitch.com/20120710-gia14xira6g8snkfgkt5s2dtnr.jpg
[4]: https://img.skitch.com/20120710-mb64gbj17xjy6geuk5db73845r.jpg
[5]: http://localhost:3000/admin/payment_methods
[6]: http://ebooks.bigbinary.com/blog/home
[7]: https://test.authorize.net
[8]: https://img.skitch.com/20120712-fshusdqr7xupjxk7khkfcn75ri.jpg
[9]: https://img.skitch.com/20120710-bkkg67qq3xxtcbc9fn95tr8q6a.jpg
[10]: http://localhost:3000/admin
[11]: https://test.authorize.net
[12]: https://img.skitch.com/20120712-fshusdqr7xupjxk7khkfcn75ri.jpg
[13]: https://img.skitch.com/20120710-eic38ceur6499x831371krtwge.jpg