use Mix.Config

config :kudos, Kudos.Repo,
  database: "kudos",
  username: "postgres",
  password: "",
  hostname: "localhost"

config :kudos, ecto_repos: [Kudos.Repo]

import_config "#{Mix.env()}.exs"
