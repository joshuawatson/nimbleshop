##	Tools	##

###	Google analytics	###

nimbleShop has built in support for google analytics.

Register for google analytics and enter the google tracking id in the admin panel. Google analytics has extra support for ecommerce applications. However you need to enable it. Follow the steps given below to enable ecommerce tracking in your google analytics account.

![Ecommerce tracking in google analytics][1]

###	Sending email in nimbleShop	###

####	mailtrap.io in development environment ####

In development environment nimbleShop sends emails  to [mailtrap.io][2]. *mailtrap.io* is a free service. 

After signing up for this service open <ins>config/application.yml</ins> and look for <ins>mailtrapio</ins>. Change <ins>xxxxx</ins> for <ins>username</ins> with the username value given by mailtrap.io . Similarly update the value for <ins>password</ins> for mailtrap.io.

####	sendgrid in staging and production environment	####

In staging and production environment nimbleShop actually delivers emails using [sendgrid][3].


###	Tools	###

[responsive.is][4] -  How responsive is your design .

[Design seeds][5] - Finding right color combination is hard. This site can help.

[cambelt.co][6] -  Create a place holder image which is not boring. You can choose the text, background color and much more.

[lorempixel.com][7] -  Find real world place holder image of any size. Images available in color and in black and white.

[mattkersley.com][8] - Easily test how responsive your design is for various sizes.

[dillinger.io][9] - Dillinger is a cloud-enabled HTML5 Markdown editor. Type some Markdown text in the left window See the HTML in the right . Magic .

[browserstack.com][10] - Live Web-Based Cross Browser Testing

[webpagetest.org][11] - Test a website's performance .

[localtunnel][12] - The easiest way to share localhost web servers to the rest of the world

[subtlepatterns][13] - patterns for page background

[1]: https://img.skitch.com/20120504-jwic5j5pb2pxunu57byw6tdbd2.jpg
[2]: http://mailtrap.io/
[3]: http://sendgrid.com
[4]: http://responsive.is/nimbleshop.net
[5]: http://design-seeds.com
[6]: http://cambelt.co
[7]: http://lorempixel.com
[8]: http://mattkersley.com/responsive
[9]: http://dillinger.io
[10]: http://www.browserstack.com
[11]: http://www.webpagetest.org
[12]: http://progrium.com/localtunnel
[13]: http://subtlepatterns.com