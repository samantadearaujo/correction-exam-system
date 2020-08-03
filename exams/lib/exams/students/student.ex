defmodule Exams.Students.Student do
  use Ecto.Schema
  import Ecto.Changeset

  schema "students" do
    field :class_id, :integer
    field :exam_id, :integer
    field :score, :decimal
    field :student_id, :id

    timestamps()
  end

  @doc false
  def changeset(student, attrs) do
    student
    |> cast(attrs, [:student_id, :class_id, :exam_id, :score])
    |> validate_required([:student_id, :class_id, :exam_id, :score])
  end
end
