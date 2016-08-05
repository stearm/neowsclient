defmodule ElixirNeowsClient.Mixfile do
  use Mix.Project

  def project do
    [app: :elixir_neows_client,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [
      applications: [:logger, :httpoison, :cowboy, :plug],
      mod: {ElixirNeowsClient, []},
      env: [cowboy_port: 4000]
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:httpoison, "~> 0.9.0"},
      {:poison, "~> 2.0"},
      {:cowboy, "~> 1.0.3"},
      {:plug, "~> 1.2-rc", override: true}
    ]
  end
end