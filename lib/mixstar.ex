defmodule MixStar do
  defmodule GitHub do

    @user_agent 'MixStar/#{Mix.Project.config[:version]} (Elixir/#{System.version})'

    def star(project) do
      case put_request(project) do
        {code, body} when code in 200..299 ->
          {:ok, code, body }
        {code, body} when is_number(code) ->
          {:error, code, body}
        {:error, reason} ->
          {:error, reason }
      end
    end

    defp star_url(project) do
      'https://api.github.com/user/starred/#{project}'
    end

    defp put_request(project) do
      oauth_token = Netrc.read |> Map.get("api.github.com") |> Map.get("password")
      authorization_value = String.to_char_list("token #{oauth_token}")
      headers = %{
        'user-agent' => @user_agent,
        'Authorization' => authorization_value
      }
      request = {star_url(project), Map.to_list(headers), '', ''}
      http_opts = [ssl: [verify: :verify_peer, cacerts: Hex.API.Certs.cacerts()]]
      case :httpc.request(:put, request, http_opts, []) do
        {:ok, response} ->
          handle_response(response)
        {:error, reason} -> {:error, reason}
      end
    end

    defp handle_response({{_version, code, _reason}, _headers, body}) do
      {code, to_string(body)}
    end
  end
end
