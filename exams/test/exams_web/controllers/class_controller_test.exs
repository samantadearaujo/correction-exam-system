defmodule ExamsWeb.ClassControllerTest do
  use ExamsWeb.ConnCase

  alias Exams.Classes
  alias Exams.Classes.Class

  @create_attrs %{
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
  @invalid_attrs %{academic: nil, created_by: nil, description: nil, id_exam: nil, modified_by: nil, name: nil, teacher_id: nil, year: nil}

  def fixture(:class) do
    {:ok, class} = Classes.create_class(@create_attrs)
    class
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all class", %{conn: conn} do
      conn = get(conn, Routes.class_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create class" do
    test "renders class when data is valid", %{conn: conn} do
      conn = post(conn, Routes.class_path(conn, :create), class: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.class_path(conn, :show, id))

      assert %{
               "id" => id,
               "academic" => 42,
               "created_by" => 42,
               "description" => "some description",
               "id_exam" => 42,
               "modified_by" => 42,
               "name" => "some name",
               "teacher_id" => 42,
               "year" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.class_path(conn, :create), class: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update class" do
    setup [:create_class]

    test "renders class when data is valid", %{conn: conn, class: %Class{id: id} = class} do
      conn = put(conn, Routes.class_path(conn, :update, class), class: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.class_path(conn, :show, id))

      assert %{
               "id" => id,
               "academic" => 43,
               "created_by" => 43,
               "description" => "some updated description",
               "id_exam" => 43,
               "modified_by" => 43,
               "name" => "some updated name",
               "teacher_id" => 43,
               "year" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, class: class} do
      conn = put(conn, Routes.class_path(conn, :update, class), class: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete class" do
    setup [:create_class]

    test "deletes chosen class", %{conn: conn, class: class} do
      conn = delete(conn, Routes.class_path(conn, :delete, class))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.class_path(conn, :show, class))
      end
    end
  end

  defp create_class(_) do
    class = fixture(:class)
    %{class: class}
  end
end
