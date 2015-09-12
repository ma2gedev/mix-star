defmodule Mix.Tasks.Deps.Star do
  use Mix.Task

  @shortdoc "Get dependencies with starring"

  @moduledoc """
  """

  import Mix.Dep, only: [loaded: 1]

  def run(args) do
    Mix.Task.run("deps.get", args)

    HTTPoison.start

    Enum.map(loaded(%{}), fn(%Mix.Dep{opts: opts, scm: scm}) ->
      github_project_path(scm, opts)
    end)
      |> Enum.filter(&(&1 != nil))
      |> Enum.map fn(gh) ->
        starring gh
      end
  end

  def starring(gh) do
    case MixStar.GitHub.star(gh) do
      { :ok, _body } ->
        IO.puts "\e[33m★  starred #{gh}\e[0m"
      { :error, body } ->
        IO.puts "\e[31mfailed to star #{gh}\e[0m"
        IO.puts body
    end
  end

  defp github_project_path(Hex.SCM, opts) do
    get_hex_package_meta(opts[:hex])
    |> search_github_link
    |> extract_github_path
  end
  defp github_project_path(Mix.SCM.Git, opts) do
    extract_github_path(opts[:git])
  end
  defp github_project_path(_, _), do: nil

  defp get_hex_package_meta(package) do
    case Hex.API.Package.get(package) do
      {_code, body} when _code in 200..299 ->
        body["meta"]
      {_code, _body} ->
        Mix.Shell.info "Failed to retrieve package information: #{package}"
        nil
    end
  end

  defp search_github_link(meta) do
    if (links = meta["links"]) && links != [] do
      case Enum.find(links, fn {_name, url} -> Regex.match?(~r/github.com/, url) end) do
        {_name, url} ->
          url
        _ -> nil
      end
    end
  end

  defp extract_github_path(nil), do: nil
  defp extract_github_path(url) do
    match_list = case Regex.match?(~r/^https:/, url) do
                   true -> Regex.named_captures(~r/^https:\/\/github.com\/(?<gh>.*)$/, url)
                   false -> Regex.named_captures(~r/^git:\/\/github.com\/(?<gh>.*).git$/, url)
                 end
    match_list["gh"]
  end
end
