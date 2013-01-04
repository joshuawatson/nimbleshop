## Releasing nimbleShop gem ##

###	New version ###

Change the rails version in `bin/nimbleshop`.

Chnage the rails version at `nimbleshop_core/lib/nimbleshop/version`.

Change nimbleShop version at `nimbleshop_core/lib/nimbleshop/version`.

Change nimbleShop version at `templates/nimbleshop/installer`.

```shell
rake nimbleshop:package_all
rake nimbleshop:bundle_all
gits add .
git commit -m 'new release'

rake nimbleshop:release_all
```
