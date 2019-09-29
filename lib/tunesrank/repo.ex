defmodule Tunesrank.Repo do
  use Ecto.Repo,
    otp_app: :tunesrank,
    adapter: Ecto.Adapters.Postgres
end
