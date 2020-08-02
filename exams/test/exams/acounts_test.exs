defmodule Exams.AcountsTest do
  use Exams.DataCase

  alias Exams.Acounts

  describe "usersprofiles" do
    alias Exams.Acounts.UserProfile

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def user_profile_fixture(attrs \\ %{}) do
      {:ok, user_profile} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Acounts.create_user_profile()

      user_profile
    end

    test "list_usersprofiles/0 returns all usersprofiles" do
      user_profile = user_profile_fixture()
      assert Acounts.list_usersprofiles() == [user_profile]
    end

    test "get_user_profile!/1 returns the user_profile with given id" do
      user_profile = user_profile_fixture()
      assert Acounts.get_user_profile!(user_profile.id) == user_profile
    end

    test "create_user_profile/1 with valid data creates a user_profile" do
      assert {:ok, %UserProfile{} = user_profile} = Acounts.create_user_profile(@valid_attrs)
      assert user_profile.name == "some name"
    end

    test "create_user_profile/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Acounts.create_user_profile(@invalid_attrs)
    end

    test "update_user_profile/2 with valid data updates the user_profile" do
      user_profile = user_profile_fixture()
      assert {:ok, %UserProfile{} = user_profile} = Acounts.update_user_profile(user_profile, @update_attrs)
      assert user_profile.name == "some updated name"
    end

    test "update_user_profile/2 with invalid data returns error changeset" do
      user_profile = user_profile_fixture()
      assert {:error, %Ecto.Changeset{}} = Acounts.update_user_profile(user_profile, @invalid_attrs)
      assert user_profile == Acounts.get_user_profile!(user_profile.id)
    end

    test "delete_user_profile/1 deletes the user_profile" do
      user_profile = user_profile_fixture()
      assert {:ok, %UserProfile{}} = Acounts.delete_user_profile(user_profile)
      assert_raise Ecto.NoResultsError, fn -> Acounts.get_user_profile!(user_profile.id) end
    end

    test "change_user_profile/1 returns a user_profile changeset" do
      user_profile = user_profile_fixture()
      assert %Ecto.Changeset{} = Acounts.change_user_profile(user_profile)
    end
  end
end
