defmodule Kudos.Slack do
  use Tesla

  plug(Tesla.Middleware.BaseUrl, Application.get_env(:kudos, :slack_base_url))
  plug(Tesla.Middleware.JSON)

  def get_access_token(code) do
    token =
      code
      |> get_body
      |> make_access_token_request
  end

  defp make_access_token_request(body) do
    uri = Application.get_env(:kudos, :slack_oauth_access_uri)
    {:ok, response} = post(uri, body)

    response
  end

  defp get_body(code) do
    %{
      client_id: Application.get_env(:kudos, :slack_client_id),
      client_secret: Application.get_env(:kudos, :slack_client_secret),
      code: code
    }
  end
end
