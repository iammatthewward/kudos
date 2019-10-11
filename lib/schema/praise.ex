defmodule Kudos.Praise do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:id, :message]}
  schema "praise" do
    field(:message, :string)
  end

  def changeset(praise, params \\ %{}) do
    praise
    |> cast(params, [:message])
    |> validate_required([:message])
  end
end
