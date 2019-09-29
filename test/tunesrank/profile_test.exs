defmodule Tunesrank.ProfileTest do
  use Tunesrank.DataCase

  alias Tunesrank.Profile

  describe "profiles" do
    alias Tunesrank.Profile.Profiles

    @valid_attrs %{description: "some description", name: "some name", user_key: "some user_key"}
    @update_attrs %{description: "some updated description", name: "some updated name", user_key: "some updated user_key"}
    @invalid_attrs %{description: nil, name: nil, user_key: nil}

    def profiles_fixture(attrs \\ %{}) do
      {:ok, profiles} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Profile.create_profiles()

      profiles
    end

    test "list_profiles/0 returns all profiles" do
      profiles = profiles_fixture()
      assert Profile.list_profiles() == [profiles]
    end

    test "get_profiles!/1 returns the profiles with given id" do
      profiles = profiles_fixture()
      assert Profile.get_profiles!(profiles.id) == profiles
    end

    test "create_profiles/1 with valid data creates a profiles" do
      assert {:ok, %Profiles{} = profiles} = Profile.create_profiles(@valid_attrs)
      assert profiles.description == "some description"
      assert profiles.name == "some name"
      assert profiles.user_key == "some user_key"
    end

    test "create_profiles/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Profile.create_profiles(@invalid_attrs)
    end

    test "update_profiles/2 with valid data updates the profiles" do
      profiles = profiles_fixture()
      assert {:ok, %Profiles{} = profiles} = Profile.update_profiles(profiles, @update_attrs)
      assert profiles.description == "some updated description"
      assert profiles.name == "some updated name"
      assert profiles.user_key == "some updated user_key"
    end

    test "update_profiles/2 with invalid data returns error changeset" do
      profiles = profiles_fixture()
      assert {:error, %Ecto.Changeset{}} = Profile.update_profiles(profiles, @invalid_attrs)
      assert profiles == Profile.get_profiles!(profiles.id)
    end

    test "delete_profiles/1 deletes the profiles" do
      profiles = profiles_fixture()
      assert {:ok, %Profiles{}} = Profile.delete_profiles(profiles)
      assert_raise Ecto.NoResultsError, fn -> Profile.get_profiles!(profiles.id) end
    end

    test "change_profiles/1 returns a profiles changeset" do
      profiles = profiles_fixture()
      assert %Ecto.Changeset{} = Profile.change_profiles(profiles)
    end
  end
end
