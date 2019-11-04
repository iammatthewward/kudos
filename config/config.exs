use Mix.Config

config :kudos, Kudos.Repo,
  database: "kudos",
  username: "postgres",
  password: "",
  hostname: "localhost"

config :kudos, ecto_repos: [Kudos.Repo]


config :kudos, slack_base_url: "https://slack.com/api"

config :kudos, slack_oauth_access_uri: "/oauth.access"

import_config "#{Mix.env()}.exs"
