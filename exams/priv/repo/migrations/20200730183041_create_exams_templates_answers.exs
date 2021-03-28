defmodule Exams.Repo.Migrations.CreateExamsTemplatesAnswers do
  @moduledoc """
  Define apenas o Profile Teacher, pode criar respostas. 
  São colocados as respostas
  """
  use Ecto.Migration

  def change do
    create table(:exams_templates_answers) do
      add :answers, :string
      add :question_id, :integer

      timestamps()
    end
  end
end
