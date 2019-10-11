defmodule ContentTypeTest do
  use ExUnit.Case, async: true
  use Plug.Test

  alias Kudos.Plug.ContentType

  @opts ContentType.init(content_type: "application/json")
  @no_opts ContentType.init([])

  test "sets the given content type" do
    conn =
      :get
      |> conn("/", "")
      |> ContentType.call(@opts)

    assert {"content-type", "application/json; charset=utf-8"} in conn.resp_headers
  end

  test "doesn't set the content type if missing from opts" do
    conn =
      :get
      |> conn("/", "")
      |> ContentType.call(@no_opts)

    refute {"content-type", "application/json; charset=utf-8"} in conn.resp_headers
  end
end
