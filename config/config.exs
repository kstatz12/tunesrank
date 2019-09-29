# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :tunesrank,
  ecto_repos: [Tunesrank.Repo]

# Configures the endpoint
config :tunesrank, TunesrankWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "RTpAEeYyGQJ3glyOJE6jGqLe4e+1fqXB1DK2EozLpc/UGrxJkZAwriUKnx2UO0aq",
  render_errors: [view: TunesrankWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Tunesrank.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :ueberauth, Ueberauth,
  providers: [
    auth0: { Ueberauth.Strategy.Auth0, []}
  ]

config :ueberauth, Ueberauth.Strategy.Auth0.OAuth,
  domain: System.get_env("AUTH0_DOMAIN"),
  client_id: System.get_env("AUTH0_CLIENT_ID"),
  client_secret: System.get_env("AUTH0_CLIENT_SECRET")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"


