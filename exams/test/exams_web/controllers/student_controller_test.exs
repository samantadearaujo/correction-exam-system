defmodule ExamsWeb.StudentControllerTest do
  use ExamsWeb.ConnCase

  alias Exams.Students
  alias Exams.Students.Student

  @create_attrs %{
    class_id: 42,
    exam_id: 42,
    score: "120.5",
    student_id: 42
  }
  @update_attrs %{
    class_id: 43,
    exam_id: 43,
    score: "456.7",
    student_id: 43
  }
  @invalid_attrs %{class_id: nil, exam_id: nil, score: nil, student_id: nil}

  def fixture(:student) do
    {:ok, student} = Students.create_student(@create_attrs)
    student
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all students", %{conn: conn} do
      conn = get(conn, Routes.student_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create student" do
    test "renders student when data is valid", %{conn: conn} do
      conn = post(conn, Routes.student_path(conn, :create), student: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.student_path(conn, :show, id))

      assert %{
               "id" => id,
               "class_id" => 42,
               "exam_id" => 42,
               "score" => "120.5",
               "student_id" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.student_path(conn, :create), student: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update student" do
    setup [:create_student]

    test "renders student when data is valid", %{conn: conn, student: %Student{id: id} = student} do
      conn = put(conn, Routes.student_path(conn, :update, student), student: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.student_path(conn, :show, id))

      assert %{
               "id" => id,
               "class_id" => 43,
               "exam_id" => 43,
               "score" => "456.7",
               "student_id" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, student: student} do
      conn = put(conn, Routes.student_path(conn, :update, student), student: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete student" do
    setup [:create_student]

    test "deletes chosen student", %{conn: conn, student: student} do
      conn = delete(conn, Routes.student_path(conn, :delete, student))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.student_path(conn, :show, student))
      end
    end
  end

  defp create_student(_) do
    student = fixture(:student)
    %{student: student}
  end
end
