defmodule ElixirNeowsClient.Plug.AppRouter do
  use Plug.Router
  import Plug.Conn

  @content_type "application/json"

  plug :match
  plug :dispatch

  get "/asteroids/list" do
    conn = fetch_query_params(conn)
    %{"from" => from, "to" => to } = conn.params
    {statusCode, body} = ElixirNeowsClient.Client.fetch_from_nasa(from, to)

    put_resp_content_type(conn, @content_type)
    |> send_resp(statusCode, Poison.encode!(body))
  end
end
