# MixStar

[![hex.pm version](https://img.shields.io/hexpm/v/mixstar.svg)](https://hex.pm/packages/mixstar) [![hex.pm downloads](https://img.shields.io/hexpm/dt/mixstar.svg)](https://hex.pm/packages/mixstar)

MixStar starred GitHub repository that depends on your project!
You just type `mix deps.star`, MixStar execute `mix deps.get` internally and starring GitHub repository.
Enjoy!

![Demo](https://github.com/ma2gedev/mix-star/raw/master/try-mix-star.gif)

## How to install

```shell
$ git clone git@github.com:ma2gedev/mix-star.git
$ cd mix-star
$ git submodule update --init
$ MIX_ENV=prod mix do archive.build, archive.install
```

Or

```shell
$ mix archive.install https://github.com/ma2gedev/mix-star/releases/download/v0.1.1/mixstar-0.1.1.ez
```

Now you get `mix deps.star` command!

## How to use

Write your GitHub credentials into `.netrc` file(locating to `~/.netrc`).

The following is a sample `.netrc` file. And execute `chmod 600 ~/.netrc` to avoid permission error.

```
machine api.github.com
  login <your github account>
  password <your 40 char github token>
```

And exec `mix deps.star`

Then stared GitHub projects that your project depends on.

## Dependencies

- [Hex](https://github.com/hexpm/hex)

## See Also

inspired by bundle-star(https://github.com/ma2gedev/bundle-star)

## LICENSE

MIT License

