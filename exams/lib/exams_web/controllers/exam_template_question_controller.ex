defmodule ExamsWeb.ExamTemplateQuestionController do
  use ExamsWeb, :controller

  alias Exams.Templates
  alias Exams.Templates.ExamTemplateQuestion

  action_fallback ExamsWeb.FallbackController

  def index(conn, _params) do
    exams_templates_questions = Templates.list_exams_templates_questions()
    render(conn, "index.json", exams_templates_questions: exams_templates_questions)
  end

  def create(conn, %{"exam_template_question" => exam_template_question_params}) do
    with {:ok, %ExamTemplateQuestion{} = exam_template_question} <- Templates.create_exam_template_question(exam_template_question_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.exam_template_question_path(conn, :show, exam_template_question))
      |> render("show.json", exam_template_question: exam_template_question)
    end
  end

  def show(conn, %{"id" => id}) do
    exam_template_question = Templates.get_exam_template_question!(id)
    render(conn, "show.json", exam_template_question: exam_template_question)
  end

  def update(conn, %{"id" => id, "exam_template_question" => exam_template_question_params}) do
    exam_template_question = Templates.get_exam_template_question!(id)

    with {:ok, %ExamTemplateQuestion{} = exam_template_question} <- Templates.update_exam_template_question(exam_template_question, exam_template_question_params) do
      render(conn, "show.json", exam_template_question: exam_template_question)
    end
  end

  def delete(conn, %{"id" => id}) do
    exam_template_question = Templates.get_exam_template_question!(id)

    with {:ok, %ExamTemplateQuestion{}} <- Templates.delete_exam_template_question(exam_template_question) do
      send_resp(conn, :no_content, "")
    end
  end
end
