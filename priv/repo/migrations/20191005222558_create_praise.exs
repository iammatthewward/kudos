defmodule Kudos.Repo.Migrations.CreatePraise do
  use Ecto.Migration

  def change do
    create table(:praise) do
      add(:message, :string)
    end
  end
end
