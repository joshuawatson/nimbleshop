## Storing arbitrary data in metadata column ##

### metadata column ###

All the tables in nimbleShop have a column called <ins>metadata</ins>. This column can be used to store any arbitrary data.

Look at <ins>Authorizedotnet.rb</ins> model in the engine to see an example of how nimbleShop itself is using <ins>metadata</ins> to store data specific to Authorize.net record.

Methods [store][1] and <ins>store_accessor</ins> play nicely with metadata column. Look at [this commit][2] to learn more about these methods.

[1]:http://api.rubyonrails.org/classes/ActiveRecord/Store.html
[2]:https://github.com/rails/rails/commit/85b64f98d100d37b3a232c315daa10fad37dccdc