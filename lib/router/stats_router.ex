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

  get "/:id" do
    result = Praise |> Repo.get(id)

    {result, code} =
      case result do
        %Praise{} -> {result, 200}
        nil -> {%{}, 404}
      end

    conn
    |> put_status(code)
    |> render_json(result)
  end

  def render_json(%{status: status} = conn, data) do
    body = Jason.encode!(%{success: true, errors: [], messages: [], result: data})

    send_resp(conn, status || 200, body)
  end
end
