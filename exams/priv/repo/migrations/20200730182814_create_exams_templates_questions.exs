defmodule Exams.Repo.Migrations.CreateExamsTemplatesQuestions do
  use Ecto.Migration
    @moduledoc """
    Define apenas o Profile Teacher, pode criar perguntas. 
    São colocados as perguntas
  """

  def change do
    create table(:exams_templates_questions) do
      add :template_id, :integer
      add :questions, :string
      add :answer_correct_id, :integer

      timestamps()
    end

  end
end
