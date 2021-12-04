# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

# Configures the endpoint
config :elixir_pokedex, ElixirPokedexWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: ElixirPokedexWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: ElixirPokedex.PubSub,
  live_view: [signing_salt: "isQI/1W6"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id, :span_id, :trace_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :tesla, adapter: Tesla.Adapter.Hackney

config :opentelemetry, :resource, service: %{name: "elixir_pokedex"}

config :elixir_pokedex,
  user_agent:
    "elixir_pokedex/#{ElixirPokedex.MixProject.project() |> Keyword.fetch!(:version)} tesla"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
