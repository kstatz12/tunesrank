defmodule Tunesrank.Profile.Profiles do
  use Ecto.Schema
  import Ecto.Changeset

  schema "profiles" do
    field :description, :string
    field :name, :string
    field :user_key, :string
    timestamps()
  end

  @doc false
  def changeset(profiles, attrs) do
    profiles
    |> cast(attrs, [:name, :description, :user_key])
    |> validate_required([:name, :description, :user_key])
  end
end
