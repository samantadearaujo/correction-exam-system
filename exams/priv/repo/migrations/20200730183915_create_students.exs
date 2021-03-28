defmodule Exams.Repo.Migrations.CreateStudents do
  @moduledoc """
  Define apenas o Profile Teacher, pode  Students. 
  São colocados as classes, para associar os alunos e os exames
  """
  use Ecto.Migration

  def change do
    create table(:students) do
      add :student_id, :id
      add :class_id, :integer
      add :exam_id, :integer
      add :score, :decimal

      timestamps()
    end
  end
end
