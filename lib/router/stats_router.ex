defmodule Kudos.StatsRouter do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/" do
    conn = put_status(conn, 200)

    render_json(conn, %{})
  end

  def render_json(%{status: status} = conn, data) do
    body = Jason.encode!(data)
    send_resp(conn, (status || 200), body)
  end

end
