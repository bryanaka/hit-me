defmodule HitMe.Repo do
  use Ecto.Repo,
    otp_app: :hit_me,
    adapter: Ecto.Adapters.Postgres
end
