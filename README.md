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

Set your GitHub oauth token to the `GITHUB_OAUTH_TOKEN` environment variable.
And exec `mix deps.star`

```
$ export GITHUB_OAUTH_TOKEN=YOUR_40_CHARACTERS_GITHUB_TOKEN
$ mix deps.star
```

Then stared GitHub projects that your project depends on.

## See Also

inspired by bundle-star(https://github.com/ma2gedev/bundle-star)

## LICENSE

MIT License

