defmodule Kudos.Plug.ContentType do
  import Plug.Conn

  def init(options), do: options

  def call(conn, opts) do
    if :content_type in Keyword.keys(opts) do
      conn |> put_resp_content_type(opts[:content_type])
    else
      conn
    end
  end
end
