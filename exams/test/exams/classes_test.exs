defmodule Exams.ClassesTest do
  use Exams.DataCase

  alias Exams.Classes

  describe "class" do
    alias Exams.Classes.Class

    @valid_attrs %{
      academic: 42,
      created_by: 42,
      description: "some description",
      id_exam: 42,
      modified_by: 42,
      name: "some name",
      teacher_id: 42,
      year: 42
    }
    @update_attrs %{
      academic: 43,
      created_by: 43,
      description: "some updated description",
      id_exam: 43,
      modified_by: 43,
      name: "some updated name",
      teacher_id: 43,
      year: 43
    }
    @invalid_attrs %{
      academic: nil,
      created_by: nil,
      description: nil,
      id_exam: nil,
      modified_by: nil,
      name: nil,
      teacher_id: nil,
      year: nil
    }

    def class_fixture(attrs \\ %{}) do
      {:ok, class} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Classes.create_class()

      class
    end

    test "list_class/0 returns all class" do
      class = class_fixture()
      assert Classes.list_class() == [class]
    end

    test "get_class!/1 returns the class with given id" do
      class = class_fixture()
      assert Classes.get_class!(class.id) == class
    end

    test "create_class/1 with valid data creates a class" do
      assert {:ok, %Class{} = class} = Classes.create_class(@valid_attrs)
      assert class.academic == 42
      assert class.created_by == 42
      assert class.description == "some description"
      assert class.id_exam == 42
      assert class.modified_by == 42
      assert class.name == "some name"
      assert class.teacher_id == 42
      assert class.year == 42
    end

    test "create_class/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Classes.create_class(@invalid_attrs)
    end

    test "update_class/2 with valid data updates the class" do
      class = class_fixture()
      assert {:ok, %Class{} = class} = Classes.update_class(class, @update_attrs)
      assert class.academic == 43
      assert class.created_by == 43
      assert class.description == "some updated description"
      assert class.id_exam == 43
      assert class.modified_by == 43
      assert class.name == "some updated name"
      assert class.teacher_id == 43
      assert class.year == 43
    end

    test "update_class/2 with invalid data returns error changeset" do
      class = class_fixture()
      assert {:error, %Ecto.Changeset{}} = Classes.update_class(class, @invalid_attrs)
      assert class == Classes.get_class!(class.id)
    end

    test "delete_class/1 deletes the class" do
      class = class_fixture()
      assert {:ok, %Class{}} = Classes.delete_class(class)
      assert_raise Ecto.NoResultsError, fn -> Classes.get_class!(class.id) end
    end

    test "change_class/1 returns a class changeset" do
      class = class_fixture()
      assert %Ecto.Changeset{} = Classes.change_class(class)
    end
  end
end
