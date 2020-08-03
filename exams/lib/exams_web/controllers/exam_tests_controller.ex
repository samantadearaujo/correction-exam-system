defmodule ExamsWeb.ExamTestsController do
  use ExamsWeb, :controller

  alias Exams.ExamsTests
  alias Exams.ExamsTests.ExamTests

  action_fallback ExamsWeb.FallbackController

  def index(conn, _params) do
    tests = ExamsTests.list_tests()
    render(conn, "index.json", tests: tests)
  end

  def create(conn, %{"exam_tests" => exam_tests_params}) do
    with {:ok, %ExamTests{} = exam_tests} <- ExamsTests.create_exam_tests(exam_tests_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.exam_tests_path(conn, :show, exam_tests))
      |> render("show.json", exam_tests: exam_tests)
    end
  end

  def show(conn, %{"id" => id}) do
    exam_tests = ExamsTests.get_exam_tests!(id)
    render(conn, "show.json", exam_tests: exam_tests)
  end

  def update(conn, %{"id" => id, "exam_tests" => exam_tests_params}) do
    exam_tests = ExamsTests.get_exam_tests!(id)

    with {:ok, %ExamTests{} = exam_tests} <- ExamsTests.update_exam_tests(exam_tests, exam_tests_params) do
      render(conn, "show.json", exam_tests: exam_tests)
    end
  end

  def delete(conn, %{"id" => id}) do
    exam_tests = ExamsTests.get_exam_tests!(id)

    with {:ok, %ExamTests{}} <- ExamsTests.delete_exam_tests(exam_tests) do
      send_resp(conn, :no_content, "")
    end
  end
end
