##	Setting up development environment ##

###	Create a directory called nimbleshop_org ###

```shell
mkdir nimbleshop_org
cd nimbleshop_org
git clone git://github.com/nimbleshop/nimbleshop.git
git clone git://github.com/nimbleshop/nimbleshop_simply.git
cd nimbleshop
rake nimbleshop:setup:local
```

Now `cd dev/myshop` and start the rails server. Use this application to play with `nimbleShop` code and to see how things work. If you have messed up your files then do not worry. Just follow the steps described above to have a clean start again.
