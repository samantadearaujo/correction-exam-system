defmodule Exams.Repo.Migrations.CreateExamsTemplates do
  use Ecto.Migration

  @moduledoc """
    Define apenas o Profile Teacher, pode criar Template. 
    Template é o modelo de prova.
  """

  def change do
    create table(:exams_templates) do
      add :teacher_id, :integer
      add :theme_id, :integer
      add :quarter, :integer
      add :name, :string

      timestamps()
    end
  end
end
