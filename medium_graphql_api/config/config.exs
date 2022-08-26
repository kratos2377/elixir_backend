# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :medium_graphql_api,
  ecto_repos: [MediumGraphqlApi.Repo]

# Configures the endpoint
config :medium_graphql_api, MediumGraphqlApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "+hGxLDlUFRhPOnETZqxHfq9XQDgsgOA3/qFj9biivXETMfSbEeWmDH67zOVsT1Qw",
  render_errors: [view: MediumGraphqlApiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: MediumGraphqlApi.PubSub,
  live_view: [signing_salt: "pzFNoGu3"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

#Guardian Config
config :medium_graphql_api, MediumGraphqlApi.Guardian,
       issuer: "medium_graphql_api",
       secret_key: "ce49QG3SydeKP7TYYMXpPrZQyATcOmcmnHODB0DVE3dXB+cq2d172t0GFu6pP0Zl"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
