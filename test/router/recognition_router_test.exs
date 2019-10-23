defmodule RecognitionRouterTest do
  use ExUnit.Case, async: true
  use Plug.Test
  use Kudos.RepoCase

  alias Kudos.RecognitionRouter

  @opts RecognitionRouter.init([])

  describe "GET /" do
    test "returns a success response code" do
      response =
        :get
        |> conn("/")
        |> RecognitionRouter.call(@opts)

      assert response.status == 200
    end

    test "returns all stored items" do
      recognitions = [
        %Kudos.Recognition{message: "great job!"},
        %Kudos.Recognition{message: "awesome sauce"}
      ]

      [{:ok, recognition1}, {:ok, recognition2}] = Enum.map(recognitions, &Kudos.Repo.insert(&1))

      response =
        :get
        |> conn("/")
        |> RecognitionRouter.call(@opts)

      {:ok, body} =
        Jason.encode(%{
          success: true,
          errors: [],
          messages: [],
          result: [recognition1, recognition2]
        })

      assert response.resp_body == body
    end
  end

  describe "GET /:id" do
    test "when no item exists for id: returns a 404 status code" do
      response =
        :get
        |> conn("/123")
        |> RecognitionRouter.call(@opts)

      assert response.status == 404
    end

    test "when item exists for id: returns a 200 status code" do
      {:ok, recognition} = Kudos.Repo.insert(%Kudos.Recognition{message: "wowzers"})

      response =
        :get
        |> conn("/#{recognition.id}")
        |> RecognitionRouter.call(@opts)

      assert response.status == 200
    end

    test "when item exists for id: returns item" do
      {:ok, recognition} = Kudos.Repo.insert(%Kudos.Recognition{message: "wowzers"})

      response =
        :get
        |> conn("/#{recognition.id}")
        |> RecognitionRouter.call(@opts)

      {:ok, body} =
        Jason.encode(%{
          success: true,
          errors: [],
          messages: [],
          result: recognition
        })

      assert response.resp_body == body
    end
  end
end
