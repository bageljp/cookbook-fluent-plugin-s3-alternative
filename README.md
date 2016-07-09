What's ?
===============
chef で使用する fluent-plugin-s3-alternative の cookbook です。
他の fluent-plugin と違ってなぜか gem に登録されてないので個別でビルドします。

Usage
-----
cookbook なので berkshelf で取ってきて使いましょう。

* Berksfile
```ruby
source "https://supermarket.chef.io"

cookbook "fluent-plugin-s3-alternative", git: "https://github.com/bageljp/cookbook-fluent-plugin-s3-alternative.git"
```

```
berks vendor
```

Recipes
----------

#### fluent-plugin-s3-alternative::default
fluent-plugin-s3-alternative を git clone して gem build してインストールします。

