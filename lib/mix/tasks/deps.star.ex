defmodule Mix.Tasks.Deps.Get do
  use Mix.Task

  @shortdoc "Get dependencies with starring"

  @moduledoc """
  """

  import Mix.Deps, only: [:loaded]

  def run(args) do
    Mix.Task.run("deps.get", args)
  end
end
