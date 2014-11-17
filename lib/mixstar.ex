defmodule MixStar do
  defmodule GitHub do

    @user_agent [ "User-Agent": "Elixir mixstar" ]

    def star(project) do
      case HTTPotion.put(star_url(project), "", @user_agent) do
        %HTTPotion.Response{body: body, status_code: status, headers: _headers}
        when status in 200..299 ->
          { :ok, body }
        %HTTPotion.Response{body: body, status_code: _status, headers: _headers} ->
          { :error, body }
      end
    end

    def star_url(project) do
      oauth_token = Netrc.read |> Map.get("api.github.com") |> Map.get("password")
      "https://api.github.com/user/starred/#{project}?access_token=" <> oauth_token
    end
  end
end
