defmodule Kudos.Application do
  use Application
  require Logger

  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: Kudos.Router, options: [port: 3000]},
      {Kudos.Repo, []}
    ]

    opts = [strategy: :one_for_one, name: Kudos.Supervisor]

    Logger.info("Starting on port 3000")

    Supervisor.start_link(children, opts)
  end
end
