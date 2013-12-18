defmodule Mix.Tasks.Deps.Star do
  use Mix.Task

  @shortdoc "Get dependencies with starring"

  @moduledoc """
  """

  import Mix.Deps, only: [loaded: 0]

  def run(args) do
    Mix.Task.run("deps.get", args)

    gh_list = Enum.map loaded, fn(Mix.Dep[scm: scm, opts: opts] = deps) ->
      match_list = Regex.named_captures(%r/^git:\/\/github.com\/(?<gh>.*).git$/g, opts[:git])
      match_list[:gh]
    end
    gh_list
      |> Enum.filter(&(&1 != nil))
      |> Enum.map fn(gh) ->
        IO.puts gh
      end
  end
end
