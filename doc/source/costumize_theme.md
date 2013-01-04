## Customize theme ##

endprologue.

### Theme customization ###

nimbleShop allows you to customize theme. Here is how you can do it.

#### Fork the theme ####

Visit [https://github.com/nimbleshop/nimbleshop_simply][1] and fork this repository.

#### Customize the forked version	####


First clone the nimbleshop repository

```shell
git clone git://github.com/nimbleshop/nimbleshop_simply.git
cd nimbleshop_simply
git tag -l
```

<ins>git tag -l</ins> should list the version you are working with. Lets assume that you are working with version <ins>0.0.14</ins> of nimbleShop.

Next let's checkout the version <ins>0.0.14</ins> of nimbleshop_simply.

```shell
git checkout v0.0.14
```

After the above command you will be in <ins>no branch</ins>. That's ok. Now create a branch called <ins>custom_theme</ins>.

```shell
git checkout -b custom_theme
```

Now push this branch to github.

```shell
git push
```

#### Configuring app to use custom_branch

Open the <ins>Gemfile</ins> of your app and change the gem <ins>nimbleshop_simply</ins> option to have github and branch option.

```shell
gem 'nimbleshop_simply', github: 'nimbleshop/nimbleshop_simply', branch: :custom_theme
```

#### Customizing theme ####

Now open file <ins>~/nimbleshop_simply/app/assets/stylesheets/nimbleshop_simply/custom.css.scss</ins>. Go to the bottom of the page and add following lines.

```shell
body {
  background: green;
}
```

#### Start your rails server	####

Now start your rails server by running command <ins>rails server</ins> and visit <ins>http:localhost:3000</ins>. If you see green background then it means your customization is working .

[1]: https://github.com/nimbleshop/nimbleshop_simply
