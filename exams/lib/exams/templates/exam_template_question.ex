defmodule Exams.Templates.ExamTemplateQuestion do
  use Ecto.Schema
  import Ecto.Changeset

  schema "exams_templates_questions" do
    field :answer_correct_id, :integer
    field :questions, :string
    field :template_id, :integer

    timestamps()
  end

  @doc false
  def changeset(exam_template_question, attrs) do
    exam_template_question
    |> cast(attrs, [:template_id, :questions, :answer_correct_id])
    |> validate_required([:template_id, :questions, :answer_correct_id])
  end
end
