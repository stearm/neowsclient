defmodule ElixirNeowsClient do
  use Application

  def start(_type, _args) do
    port = Application.get_env :elixir_neows_client, :cowboy_port
    children = [Plug.Adapters.Cowboy.child_spec(:http, ElixirNeowsClient.Plug.AppRouter, [], port: port)]
    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
