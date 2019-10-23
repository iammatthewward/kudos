defmodule Kudos.Recognition do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:id, :message]}
  schema "recognition" do
    field(:message, :string)
  end

  def changeset(recognition, params \\ %{}) do
    recognition
    |> cast(params, [:message])
    |> validate_required([:message])
  end
end
