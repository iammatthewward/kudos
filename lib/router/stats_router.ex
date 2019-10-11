defmodule Kudos.StatsRouter do
  use Plug.Router
  alias Kudos.Praise
  alias Kudos.Repo

  plug(:match)
  plug(:dispatch)

  get "/" do
    all_results = Praise |> Repo.all()

    conn
    |> put_status(200)
    |> render_json(all_results)
  end

  def render_json(%{status: status} = conn, data) do
    body = Jason.encode!(data)
    send_resp(conn, status || 200, body)
  end
end
