defmodule Tunesrank.Repo.Migrations.CreateProfiles do
  use Ecto.Migration

  def change do
    create table(:profiles) do
      add :name, :string
      add :description, :string
      add :user_key, :string

      timestamps()
    end

  end
end
