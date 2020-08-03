defmodule ExamsWeb.ExamTemplateView do
  use ExamsWeb, :view
  alias ExamsWeb.ExamTemplateView

  def render("index.json", %{exams_templates: exams_templates}) do
    %{data: render_many(exams_templates, ExamTemplateView, "exam_template.json")}
  end

  def render("show.json", %{exam_template: exam_template}) do
    %{data: render_one(exam_template, ExamTemplateView, "exam_template.json")}
  end

  def render("exam_template.json", %{exam_template: exam_template}) do
    %{id: exam_template.id,
      teacher_id: exam_template.teacher_id,
      theme_id: exam_template.theme_id,
      quarter: exam_template.quarter}
  end
end
