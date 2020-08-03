defmodule ExamsWeb.ExamTestsView do
  use ExamsWeb, :view
  alias ExamsWeb.ExamTestsView

  def render("index.json", %{tests: tests}) do
    %{data: render_many(tests, ExamTestsView, "exam_tests.json")}
  end

  def render("show.json", %{exam_tests: exam_tests}) do
    %{data: render_one(exam_tests, ExamTestsView, "exam_tests.json")}
  end

  def render("exam_tests.json", %{exam_tests: exam_tests}) do
    %{id: exam_tests.id,
      template_id: exam_tests.template_id,
      name: exam_tests.name,
      total_question: exam_tests.total_question,
      score_exam: exam_tests.score_exam}
  end
end
