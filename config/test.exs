use Mix.Config

config :kudos, Kudos.Repo,
  database: "kudos_test",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
