defmodule PhoeX.Repo do
  use Ecto.Repo,
    otp_app: :phoeX,
    adapter: Ecto.Adapters.Postgres
end
