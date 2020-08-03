defmodule ExamsWeb.ExamTemplateAnswerController do
  use ExamsWeb, :controller

  alias Exams.Templates
  alias Exams.Templates.ExamTemplateAnswer

  action_fallback ExamsWeb.FallbackController

  def index(conn, _params) do
    exams_templates_answers = Templates.list_exams_templates_answers()
    render(conn, "index.json", exams_templates_answers: exams_templates_answers)
  end

  def create(conn, %{"exam_template_answer" => exam_template_answer_params}) do
    with {:ok, %ExamTemplateAnswer{} = exam_template_answer} <- Templates.create_exam_template_answer(exam_template_answer_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.exam_template_answer_path(conn, :show, exam_template_answer))
      |> render("show.json", exam_template_answer: exam_template_answer)
    end
  end

  def show(conn, %{"id" => id}) do
    exam_template_answer = Templates.get_exam_template_answer!(id)
    render(conn, "show.json", exam_template_answer: exam_template_answer)
  end

  def update(conn, %{"id" => id, "exam_template_answer" => exam_template_answer_params}) do
    exam_template_answer = Templates.get_exam_template_answer!(id)

    with {:ok, %ExamTemplateAnswer{} = exam_template_answer} <- Templates.update_exam_template_answer(exam_template_answer, exam_template_answer_params) do
      render(conn, "show.json", exam_template_answer: exam_template_answer)
    end
  end

  def delete(conn, %{"id" => id}) do
    exam_template_answer = Templates.get_exam_template_answer!(id)

    with {:ok, %ExamTemplateAnswer{}} <- Templates.delete_exam_template_answer(exam_template_answer) do
      send_resp(conn, :no_content, "")
    end
  end
end
