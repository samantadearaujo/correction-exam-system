# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :exams,
  ecto_repos: [Exams.Repo]

# Configures the endpoint
config :exams, ExamsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "4FEL1fkl6UPA8JPil7jkwTphatlTX/5by4v4t55LmBYA13ng5gPedGn4/mrsK0sb",
  render_errors: [view: ExamsWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Exams.PubSub,
  live_view: [signing_salt: "BaksZFUB"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

#Setting environment authentication
config :exams, ExamsWeb.Guardian,
       issuer: "exams",
       secret_key: "ub9ELQdn2LKvLap+Kn08/ZebbPKo64ESCjJsaNUZCaUUhdOyE7XJGymGQjk7rdI7" #remove e colocar este token em env.

