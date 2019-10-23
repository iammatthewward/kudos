defmodule Elixir.Kudos.Repo.Migrations.RenamePraiseToRecognition do
  use Ecto.Migration

  def change do
    rename table(:praise), to: table(:recognition)
  end
end
