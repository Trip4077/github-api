defmodule GithubProject.ApiWrapper do
#    def get_repos do
#        HTTPoison.get! "https://api.github.com"
#        |> IO.puts
#    end

    use HTTPoison.Base

    @expected_fields ~w(
        login id avatar_url gravatar_id url html_url followers_url
        following_url gists_url starred_url subscriptions_url
        organizations_url repos_url events_url received_events_url type
        site_admin name company blog location email hireable bio
        public_repos public_gists followers following created_at updated_at
      )

    def process_request_url(url) do
        IO.puts "enter url"
        "https://api.github.com/" <> url
    end

    def process_response_body(body) do
        IO.puts "enter body"
        body
        |> Poison.decode!
        |> Map.take(@expected_fields)
        |> Enum.map(fn({k, v}) -> {String.to_atom(k), v} end)
    end

    def get_repos do
        IO.puts "enter get_repos"
        GithubProject.ApiWrapper.process_request_url("")
        |> IO.puts
    end
end