defmodule RecognitionRouterTest do
  import RecognitionRouter.Test.Helpers
  use ExUnit.Case, async: true
  use Plug.Test
  use Kudos.RepoCase

  alias Kudos.RecognitionRouter

  @opts RecognitionRouter.init([])

  describe "GET /" do
    setup :insert_many

    test "returns a success response code" do
      response =
        :get
        |> conn("/")
        |> RecognitionRouter.call(@opts)

      assert response.status == 200
    end

    test "returns all stored items", %{recognitions: recognitions} do
      response =
        :get
        |> conn("/")
        |> RecognitionRouter.call(@opts)

      body = get_success_body(recognitions)

      assert response.resp_body == body
    end
  end

  describe "GET /:id" do
    setup :insert_one

    test "when no item exists for id: returns a 404 status code" do
      response =
        :get
        |> conn("/123")
        |> RecognitionRouter.call(@opts)

      assert response.status == 404
    end

    test "when item exists for id: returns a 200 status code", %{recognition: recognition} do
      response =
        :get
        |> conn("/#{recognition.id}")
        |> RecognitionRouter.call(@opts)

      assert response.status == 200
    end

    test "when item exists for id: returns item", %{recognition: recognition} do
      response =
        :get
        |> conn("/#{recognition.id}")
        |> RecognitionRouter.call(@opts)

      body = get_success_body(recognition)

      assert response.resp_body == body
    end
  end
end
