defmodule Exams.Repo.Migrations.CreateTests do
     @moduledoc """
     Define apenas o Profile Teacher, pode criar Tests. 
     São colocados as classes, para associar os templates e os exames
     """
  use Ecto.Migration

  def change do
    create table(:tests) do
      add :template_id, :integer
      add :name, :string
      add :total_question, :integer
      add :score_exam, :decimal

      timestamps()
    end

  end
end
