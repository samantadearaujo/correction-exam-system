defmodule ExamsWeb.ExamStudentView do
  use ExamsWeb, :view
  alias ExamsWeb.ExamStudentView

  def render("index.json", %{examstudent: examstudent}) do
    %{data: render_many(examstudent, ExamStudentView, "exam_student.json")}
  end

  def render("show.json", %{exam_student: exam_student}) do
    %{data: render_one(exam_student, ExamStudentView, "exam_student.json")}
  end

  def render("exam_student.json", %{exam_student: exam_student}) do
    %{
      id: exam_student.id,
      student_id: exam_student.student_id,
      exam_id: exam_student.exam_id,
      question_student: exam_student.question_student,
      answer_student: exam_student.answer_student
    }
  end
end
