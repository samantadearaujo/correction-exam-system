defmodule ExamsWeb.ExamTemplateAnswerView do
  use ExamsWeb, :view
  alias ExamsWeb.ExamTemplateAnswerView

  def render("index.json", %{exams_templates_answers: exams_templates_answers}) do
    %{data: render_many(exams_templates_answers, ExamTemplateAnswerView, "exam_template_answer.json")}
  end

  def render("show.json", %{exam_template_answer: exam_template_answer}) do
    %{data: render_one(exam_template_answer, ExamTemplateAnswerView, "exam_template_answer.json")}
  end

  def render("exam_template_answer.json", %{exam_template_answer: exam_template_answer}) do
    %{id: exam_template_answer.id,
      answers: exam_template_answer.answers,
      question_id: exam_template_answer.question_id}
  end
end
