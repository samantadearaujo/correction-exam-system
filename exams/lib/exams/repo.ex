defmodule Exams.Repo do
  use Ecto.Repo,
    otp_app: :exams,
    adapter: Ecto.Adapters.Postgres
end
