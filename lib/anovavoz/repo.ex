defmodule Anovavoz.Repo do
  use Ecto.Repo,
    otp_app: :anovavoz,
    adapter: Ecto.Adapters.Postgres
end
