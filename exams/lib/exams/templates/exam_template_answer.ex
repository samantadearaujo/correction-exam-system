defmodule Exams.Templates.ExamTemplateAnswer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "exams_templates_answers" do
    field :answers, :string
    field :question_id, :integer

    timestamps()
  end

  @doc false
  def changeset(exam_template_answer, attrs) do
    exam_template_answer
    |> cast(attrs, [:answers, :question_id])
    |> validate_required([:answers, :question_id])
  end
end
