defmodule KudosTest do
  use ExUnit.Case
  doctest Kudos

  test "greets the world" do
    assert Kudos.hello() == :world
  end
end
