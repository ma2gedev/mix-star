# MixStar

MixStar starred GitHub repository that depends on your project!
You just type `mix deps.star`, MixStar execute `mix deps.get` internally and starring GitHub repository.
Enjoy!

## How to install

```
$ git clone git@github.com:ma2gedev/mix-star.git
$ cd mix-star
$ mix deps.get
$ mix do archive.build, archive.install
```

Now you get `mix deps.star` command!

## How to use

```
$ export GITHUB_OAUTH_TOKEN=YOUR_40_CHARACTERS_GITHUB_TOKEN
$ cd YOUR_ELIXIR_PROJECT
$ mix deps.star
```

## See Also

inspired by bundle-star(https://github.com/ma2gedev/bundle-star)

## LICENSE

MIT License

