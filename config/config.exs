use Mix.Config

config :kudos, Kudos.Repo,
  database: "kudos_repo",
  username: "postgres",
  password: "",
  hostname: "localhost"

config :kudos, ecto_repos: [Kudos.Repo]
