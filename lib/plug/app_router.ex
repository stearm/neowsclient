defmodule ElixirNeowsClient.Plug.AppRouter do
  use Plug.Router
  import Plug.Conn

  plug :match
  plug :dispatch

  get "/asteroids/list" do
    conn = fetch_query_params conn
    %{"from" => from, "to" => to } = conn.params
    {statusCode, body} = ElixirNeowsClient.Client.fetch_from_nasa from, to
    send_resp conn, statusCode, Poison.encode!(body)
  end
end
