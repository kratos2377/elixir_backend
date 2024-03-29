# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :auth,
  ecto_repos: [Auth.Repo]

# Configures the endpoint
config :auth, AuthWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "VMP+SpCO6RIPIQWifLS7wuCgWaRP6OeuMpr7bKVjmaB1BMkkS2Dtmjmul2DoIKy6",
  render_errors: [view: AuthWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Auth.PubSub,
  live_view: [signing_salt: "dG3OTBVh"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
