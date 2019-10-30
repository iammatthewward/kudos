defmodule RecognitionRouter.Test.Helpers do
  def insert_many(_context) do
    recognitions = [
      %Kudos.Recognition{message: "great job!"},
      %Kudos.Recognition{message: "awesome sauce"}
    ]

    [{:ok, recognition1}, {:ok, recognition2}] = Enum.map(recognitions, &Kudos.Repo.insert(&1))

    [recognitions: [recognition1, recognition2]]
  end

  def insert_one(_context) do
    {:ok, recognition} = Kudos.Repo.insert(%Kudos.Recognition{message: "wowzers"})

    [recognition: recognition]
  end

  def get_success_body(result) do
    {:ok, body} =
      Jason.encode(%{
        success: true,
        errors: [],
        messages: [],
        result: result
      })

    body
  end
end
