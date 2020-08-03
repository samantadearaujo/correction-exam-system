defmodule ExamsWeb.ExamStudentControllerTest do
  use ExamsWeb.ConnCase

  alias Exams.ExamsTests
  alias Exams.ExamsTests.ExamStudent

  @create_attrs %{
    answer_student: "some answer_student",
    exam_id: 42,
    question_student: "some question_student",
    student_id: 42
  }
  @update_attrs %{
    answer_student: "some updated answer_student",
    exam_id: 43,
    question_student: "some updated question_student",
    student_id: 43
  }
  @invalid_attrs %{answer_student: nil, exam_id: nil, question_student: nil, student_id: nil}

  def fixture(:exam_student) do
    {:ok, exam_student} = ExamsTests.create_exam_student(@create_attrs)
    exam_student
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all examstudent", %{conn: conn} do
      conn = get(conn, Routes.exam_student_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create exam_student" do
    test "renders exam_student when data is valid", %{conn: conn} do
      conn = post(conn, Routes.exam_student_path(conn, :create), exam_student: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.exam_student_path(conn, :show, id))

      assert %{
               "id" => id,
               "answer_student" => "some answer_student",
               "exam_id" => 42,
               "question_student" => "some question_student",
               "student_id" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.exam_student_path(conn, :create), exam_student: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update exam_student" do
    setup [:create_exam_student]

    test "renders exam_student when data is valid", %{conn: conn, exam_student: %ExamStudent{id: id} = exam_student} do
      conn = put(conn, Routes.exam_student_path(conn, :update, exam_student), exam_student: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.exam_student_path(conn, :show, id))

      assert %{
               "id" => id,
               "answer_student" => "some updated answer_student",
               "exam_id" => 43,
               "question_student" => "some updated question_student",
               "student_id" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, exam_student: exam_student} do
      conn = put(conn, Routes.exam_student_path(conn, :update, exam_student), exam_student: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete exam_student" do
    setup [:create_exam_student]

    test "deletes chosen exam_student", %{conn: conn, exam_student: exam_student} do
      conn = delete(conn, Routes.exam_student_path(conn, :delete, exam_student))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.exam_student_path(conn, :show, exam_student))
      end
    end
  end

  defp create_exam_student(_) do
    exam_student = fixture(:exam_student)
    %{exam_student: exam_student}
  end
end
