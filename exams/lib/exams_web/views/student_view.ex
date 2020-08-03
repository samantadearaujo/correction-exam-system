defmodule ExamsWeb.StudentView do
  use ExamsWeb, :view
  alias ExamsWeb.StudentView

  def render("index.json", %{students: students}) do
    %{data: render_many(students, StudentView, "student.json")}
  end

  def render("show.json", %{student: student}) do
    %{data: render_one(student, StudentView, "student.json")}
  end

  def render("student.json", %{student: student}) do
    %{id: student.id,
      student_id: student.student_id,
      class_id: student.class_id,
      exam_id: student.exam_id,
      score: student.score}
  end
end
