defmodule Kudos.RecognitionRouter do
  use Plug.Router
  alias Kudos.Recognition
  alias Kudos.Repo

  plug(:match)
  plug(:dispatch)

  get "/" do
    all_results = Recognition |> Repo.all()

    conn
    |> put_status(200)
    |> render_json(all_results)
  end

  get "/:id" do
    result = Recognition |> Repo.get(id)

    {result, code} =
      case result do
        %Recognition{} -> {result, 200}
        nil -> {%{}, 404}
      end

    conn
    |> put_status(code)
    |> render_json(result)
  end

  post "/" do
    %{ body_params: params } = conn
    message = Map.get(params, "message")

    changeset = Recognition.changeset(%Recognition{ message: message }, %{})

    { :ok, recognition } = Repo.insert(changeset)

    conn
    |> put_status(201)
    |> render_json(recognition)
  end

  def render_json(%{status: status} = conn, data) do
    body = Jason.encode!(%{success: true, errors: [], messages: [], result: data})

    send_resp(conn, status || 200, body)
  end
end
