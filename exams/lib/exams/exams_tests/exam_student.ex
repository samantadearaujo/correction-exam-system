defmodule Exams.ExamsTests.ExamStudent do
  use Ecto.Schema
  import Ecto.Changeset

  schema "examstudent" do
    field :answer_student, :string
    field :exam_id, :integer
    field :question_student, :string
    field :student_id, :integer

    timestamps()
  end

  @doc false
  def changeset(exam_student, attrs) do
    exam_student
    |> cast(attrs, [:student_id, :exam_id, :question_student, :answer_student])
    |> validate_required([:student_id, :exam_id, :question_student, :answer_student])
  end
end
