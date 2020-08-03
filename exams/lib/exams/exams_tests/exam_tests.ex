defmodule Exams.ExamsTests.ExamTests do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tests" do
    field :name, :string
    field :score_exam, :decimal
    field :template_id, :integer
    field :total_question, :integer

    timestamps()
  end

  @doc false
  def changeset(exam_tests, attrs) do
    exam_tests
    |> cast(attrs, [:template_id, :name, :total_question, :score_exam])
    |> validate_required([:template_id, :name, :total_question, :score_exam])
  end
end
