defmodule Mix.Tasks.Deps.Star do
  use Mix.Task

  @shortdoc "Get dependencies with starring"

  @moduledoc """
  """

  import Mix.Deps, only: [loaded: 0]

  def run(args) do
    Mix.Task.run("deps.get", args)

    Mix.Task.run "app.start", args

    Enum.map(loaded, fn(Mix.Dep[opts: opts]) ->
      match_list = Regex.named_captures(%r/^git:\/\/github.com\/(?<gh>.*).git$/g, opts[:git])
      match_list[:gh]
    end)
      |> Enum.filter(&(&1 != nil))
      |> Enum.map fn(gh) ->
        starring gh
      end
  end

  def starring(gh) do
    case MixStar.GitHub.star(gh) do
      { :ok, _body } ->
        IO.puts "starred #{gh}"
      { :error, body } ->
        IO.puts "failed to star #{gh}"
        IO.puts body
    end
  end
end
