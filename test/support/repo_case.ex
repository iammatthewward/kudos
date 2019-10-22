defmodule Kudos.RepoCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      alias Kudos.Repo

      import Ecto
      import Ecto.Query
      import Kudos.RepoCase
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Kudos.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Kudos.Repo, {:shared, self()})
    end

    :ok
  end
end
