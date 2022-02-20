defmodule Knox.Repo do
  use Ecto.Repo,
    otp_app: :knox,
    adapter: Ecto.Adapters.Postgres
end
