defmodule StatsRouterTest do
  use ExUnit.Case, async: true
  use Plug.Test
  use Kudos.RepoCase

  alias Kudos.StatsRouter

  @opts StatsRouter.init([])

  describe "GET /" do
    test "returns a success response code" do
      response =
        :get
        |> conn("/")
        |> StatsRouter.call(@opts)

      assert response.status == 200
    end

    test "returns all stored items" do
      praises = [%Kudos.Praise{message: "great job!"}, %Kudos.Praise{message: "awesome sauce"}]
      [{:ok, praise1}, {:ok, praise2}] = Enum.map(praises, &Kudos.Repo.insert(&1))

      response =
        :get
        |> conn("/")
        |> StatsRouter.call(@opts)

      {:ok, body} =
        Jason.encode(%{
          success: true,
          errors: [],
          messages: [],
          result: [praise1, praise2]
        })

      assert response.resp_body == body
    end
  end
end
