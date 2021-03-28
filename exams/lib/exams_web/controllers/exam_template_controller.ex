defmodule ExamsWeb.ExamTemplateController do
  use ExamsWeb, :controller

  alias Exams.Templates
  alias Exams.Templates.ExamTemplate

  action_fallback ExamsWeb.FallbackController

  def index(conn, _params) do
    exams_templates = Templates.list_exams_templates()
    render(conn, "index.json", exams_templates: exams_templates)
  end

  def create(conn, %{"exam_template" => exam_template_params}) do
    with {:ok, %ExamTemplate{} = exam_template} <-
           Templates.create_exam_template(exam_template_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.exam_template_path(conn, :show, exam_template))
      |> render("show.json", exam_template: exam_template)
    end
  end

  def show(conn, %{"id" => id}) do
    exam_template = Templates.get_exam_template!(id)
    render(conn, "show.json", exam_template: exam_template)
  end

  def update(conn, %{"id" => id, "exam_template" => exam_template_params}) do
    exam_template = Templates.get_exam_template!(id)

    with {:ok, %ExamTemplate{} = exam_template} <-
           Templates.update_exam_template(exam_template, exam_template_params) do
      render(conn, "show.json", exam_template: exam_template)
    end
  end

  def delete(conn, %{"id" => id}) do
    exam_template = Templates.get_exam_template!(id)

    with {:ok, %ExamTemplate{}} <- Templates.delete_exam_template(exam_template) do
      send_resp(conn, :no_content, "")
    end
  end
end
