# MixStar

[![hex.pm version](https://img.shields.io/hexpm/v/mixstar.svg)](https://hex.pm/packages/mixstar) [![hex.pm downloads](https://img.shields.io/hexpm/dt/mixstar.svg)](https://hex.pm/packages/mixstar)

MixStar starred GitHub repository that depends on your project!
You just type `mix deps.star`, MixStar execute `mix deps.get` internally and starring GitHub repository.
Enjoy!

## How to install

Add `:mixstar` to your project's dependencies with `only: :dev`:

```
# mix.exs
def deps do
  [{:mixstar, "~> 0.0.1", only: :dev}]
end
```

And fetch: `mix deps.get`

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

```
$ mix deps.star
```

Then stared GitHub projects that your project depends on.

## See Also

inspired by bundle-star(https://github.com/ma2gedev/bundle-star)

## LICENSE

MIT License

