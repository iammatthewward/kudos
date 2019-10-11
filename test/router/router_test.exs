defmodule RouterTest do
  use ExUnit.Case, async: true
  use Plug.Test

  alias Kudos.Router

  @opts Router.init([])

  describe "GET unknown" do
    test "returns a 404 error code" do
      response =
        :get
        |> conn("/")
        |> Router.call(@opts)

      assert response.status == 404
    end

    test "returns an error message" do
      response =
        :get
        |> conn("/banana")
        |> Router.call(@opts)

      assert response.resp_body == Jason.encode!(%{error: "Not found"})
    end
  end
end
