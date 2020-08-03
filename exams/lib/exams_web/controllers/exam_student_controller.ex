defmodule ExamsWeb.ExamStudentController do
  use ExamsWeb, :controller

  alias Exams.ExamsTests
  alias Exams.ExamsTests.ExamStudent

  action_fallback ExamsWeb.FallbackController

  def index(conn, _params) do
    examstudent = ExamsTests.list_examstudent()
    render(conn, "index.json", examstudent: examstudent)
  end

  def create(conn, %{"exam_student" => exam_student_params}) do
    with {:ok, %ExamStudent{} = exam_student} <- ExamsTests.create_exam_student(exam_student_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.exam_student_path(conn, :show, exam_student))
      |> render("show.json", exam_student: exam_student)
    end
  end

  def show(conn, %{"id" => id}) do
    exam_student = ExamsTests.get_exam_student!(id)
    render(conn, "show.json", exam_student: exam_student)
  end

  def update(conn, %{"id" => id, "exam_student" => exam_student_params}) do
    exam_student = ExamsTests.get_exam_student!(id)

    with {:ok, %ExamStudent{} = exam_student} <- ExamsTests.update_exam_student(exam_student, exam_student_params) do
      render(conn, "show.json", exam_student: exam_student)
    end
  end

  def delete(conn, %{"id" => id}) do
    exam_student = ExamsTests.get_exam_student!(id)

    with {:ok, %ExamStudent{}} <- ExamsTests.delete_exam_student(exam_student) do
      send_resp(conn, :no_content, "")
    end
  end
end
