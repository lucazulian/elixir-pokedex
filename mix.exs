defmodule ElixirPokedex.MixProject do
  use Mix.Project

  def project do
    [
      app: :elixir_pokedex,
      version: "0.1.0",
      elixir: "~> 1.12",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      dialyzer: dialyzer(),
      preferred_cli_env: preferred_cli_env(),
      test_coverage: [tool: ExCoveralls]
    ]
  end

  def application do
    [
      mod: {ElixirPokedex.Application, []},
      extra_applications: [:logger, :runtime_tools, :os_mon]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:credo, "~> 1.5", only: [:dev], runtime: false},
      {:dialyxir, "~> 1.1", only: [:dev], runtime: false},
      {:excoveralls, "~> 0.10", only: [:dev, :test]},
      {:gettext, "~> 0.18"},
      {:jason, "~> 1.2"},
      {:muzak, "~> 1.1"},
      {:noether, "~> 0.2.2"},
      {:phoenix, "~> 1.6.0"},
      {:phoenix_live_dashboard, "~> 0.5"},
      {:plug_cowboy, "~> 2.5"},
      {:telemetry_metrics, "~> 0.6"},
      {:telemetry_poller, "~> 1.0"},
      {:tesla, "~> 1.4"},
      {:hackney, "~> 1.17"},
      {:opentelemetry_logger_metadata, "~> 0.1.0-rc"},
      {:opentelemetry_exporter, "~> 1.0.0-rc.1"},
      {:opentelemetry_ecto, "~> 1.0.0-rc.1"},
      {:opentelemetry_phoenix, "~> 1.0.0-rc.2"},
      {:opentelemetry, "~> 1.0.0-rc.2"}
    ]
  end

  defp aliases do
    [
      check: [
        "credo --strict",
        "dialyzer --format dialyzer"
      ],
      cover: ["coveralls"],
      "cover.detail": "coveralls.detail",
      cs: "compile --all-warnings --ignore-module-conflict --debug-info",
      "format.all": "format mix.exs 'lib/**/*.{ex,exs}' 'test/**/*.{ex,exs}' 'config/*.{ex,exs}'",
      serve: "phx.server",
      setup: ["deps.get"],
      t: "test --trace"
    ]
  end

  defp dialyzer do
    [
      ignore_warnings: ".dialyzer_ignore.exs",
      plt_add_apps: [:ex_unit, :jason, :mix],
      plt_add_deps: :app_tree,
      plt_file: {:no_warn, "priv/plts/elixir_pokedex_1_12_3_otp_24.plt"}
    ]
  end

  defp preferred_cli_env do
    [
      coveralls: :test,
      cover: :test,
      "cover.detail": :test,
      "cover.html": :test,
      muzak: :test,
      t: :test
    ]
  end
end
