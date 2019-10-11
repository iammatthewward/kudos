defmodule StatsRouterTest do
  use ExUnit.Case, async: true
  use Plug.Test

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
  end
end
