# MixStar

MixStar starred GitHub repository that depends on your project!
You just type `mix deps.star`, MixStar execute `mix deps.get` internally and starring GitHub repository.
Enjoy!

## How to install

Add `:mixstar` to your project's dependencies with `only: :dev`:

```
# mix.exs
def deps do
  [{:mixstar, github: "ma2gedev/mix-star", only: :dev}]
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

