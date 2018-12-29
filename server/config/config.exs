# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :hit_me,
  ecto_repos: [HitMe.Repo]

# Configures the endpoint
config :hit_me, HitMeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "vv4iNWItOCnJYNT8NNG8sKt4pO8mOkCI2E/i72zwKwhy3cJYwXF5QUD4aLErwu1c",
  render_errors: [view: HitMeWeb.ErrorView, accepts: ~w(json json-api)],
  pubsub: [name: HitMe.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason
config :phoenix, :format_encoders, "json-api": Jason

config :mime, :types, %{
  "application/vnd.api+json" => ["json-api"]
}

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
