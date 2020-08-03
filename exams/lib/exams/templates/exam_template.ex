defmodule Exams.Templates.ExamTemplate do
  use Ecto.Schema
  import Ecto.Changeset

  schema "exams_templates" do
    field :quarter, :integer
    field :teacher_id, :integer
    field :theme_id, :integer
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(exam_template, attrs) do
    exam_template
    |> cast(attrs, [:teacher_id, :theme_id, :quarter, :name])
    |> validate_required([:teacher_id, :theme_id, :quarter, :name])
  end
end
