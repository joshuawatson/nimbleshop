## Stripe ##

[Stripe][1] is a payment gateway and processing service provider allowing merchants to accept credit cards.

### Test account ###

Stripe provides [test account][2] which can be used to test the application before the application goes live. nimbleShop comes with stripe test account credentials. However if you want to login at stripe and see the transaction details for yourself then you should get your own account.

Follow the instructions given below to get your stripe test account. If
you do not want to setup your own stripe account info at this time then
skip the "Sign up" step.

#### Sign up ####

Visit [stripe dashboard][3] and sign up.  After signing up  go to "Your Account" > "Account Settings" > "API Keys" at stripe site.

#### Update nimbleShop to use the new stripe test credentials ####

* Visit [Admin tab Payment methods][4].
* Disable the Authorize.net payment method.
* Now visit [Admin tab Payment methods][4].
* Click on "Add payment method" pulldown menu and click on "Stripe" .
* Update <ins>Publishable key</ins> and <ins>Secret key</ins> for stripe.

###	Paying using Credit card ###

Now that <ins>Stripe</ins> has been setup with new <ins>API Credentials</ins> lets try to checkout something using Stripe .

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
<td align="left">4242424242424242</td>
</tr>
<tr class="odd">
<td align="left">Visa</td>
<td align="left">4012888888881881</td>
</tr>
<tr class="even">
<td align="left">Mastercard</td>
<td align="left">5555555555554444</td>
</tr>
<tr class="odd">
<td align="left">Mastercard</td>
<td align="left">5105105105105100</td>
</tr>
<tr class="even">
<td align="left">American Express</td>
<td align="left">378282246310005</td>
</tr>
<tr class="odd">
<td align="left">American Express</td>
<td align="left">371449635398431</td>
</tr>
<tr class="even">
<td align="left">Discover</td>
<td align="left">6011111111111117</td>
</tr>
<tr class="odd">
<td align="left">Discover</td>
<td align="left">6011000990139424</td>
</tr>
<tr class="even">
<td align="left">JCB</td>
<td align="left">3530111333300000</td>
</tr>
<tr class="odd">
<td align="left">JCB</td>
<td align="left">3566002020360505</td>
</tr>
<tr class="even">
<td align="left">Diners Club</td>
<td align="left">30569309025904</td>
</tr>
<tr class="odd">
<td align="left">Diners Club</td>
<td align="left">38520000023237</td>
</tr>
</tbody>
</table>


* Expiration date must be set to the present day or later.
* Security code for American express must be 4 digits. For all others use 3 digits.

#### Checking transactions ####

Lets verify that the transaction that we just processed is indeed showing up in stripe dashboard.


* Visit [https://manage.stripe.com][3] and login with valid credentials.
* Click on <ins>Payments</ins> tab and the very top transaction should be the transaction just processed.

[1]: http://www.stripe.come
[2]: https://manage.stripe.com/#test/dashboard
[3]: https://manage.stripe.com
[4]: http://localhost:3000/admin/payment_methods