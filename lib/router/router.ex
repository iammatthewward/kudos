defmodule Kudos.Router do
  use Plug.Router

  alias Kudos.RecognitionRouter
  alias Kudos.Plug.ContentType

  plug(Plug.Logger)
  plug(Plug.Parsers, parsers: [:urlencoded, :multipart, :json], json_decoder: Jason)
  plug(ContentType, content_type: "application/json")
  plug(:match)
  plug(:dispatch)

  forward("/recognition", to: RecognitionRouter)

  match _ do
    body = Jason.encode!(%{error: "Not found"})
    send_resp(conn, 404, body)
  end
end
