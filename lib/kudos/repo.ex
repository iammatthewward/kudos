defmodule Kudos.Repo do
  use Ecto.Repo,
    otp_app: :kudos,
    adapter: Ecto.Adapters.Postgres
end
