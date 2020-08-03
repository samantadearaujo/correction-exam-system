defmodule ExamsWeb.ExamTemplateQuestionView do
  use ExamsWeb, :view
  alias ExamsWeb.ExamTemplateQuestionView

  def render("index.json", %{exams_templates_questions: exams_templates_questions}) do
    %{data: render_many(exams_templates_questions, ExamTemplateQuestionView, "exam_template_question.json")}
  end

  def render("show.json", %{exam_template_question: exam_template_question}) do
    %{data: render_one(exam_template_question, ExamTemplateQuestionView, "exam_template_question.json")}
  end

  def render("exam_template_question.json", %{exam_template_question: exam_template_question}) do
    %{id: exam_template_question.id,
      template_id: exam_template_question.template_id,
      questions: exam_template_question.questions,
      answer_correct_id: exam_template_question.answer_correct_id}
  end
end
