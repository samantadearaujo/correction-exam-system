defmodule Exams.Repo.Migrations.CreateExamstudent do
  @moduledoc """
  Define apenas o Profile Students, pode criar Tests. 
  São colocados as classes, para associar os estudantes
   , questões, respostas e os exames
  """
  use Ecto.Migration

  def change do
    create table(:examstudent) do
      add :student_id, :integer
      add :exam_id, :integer
      add :question_student, :string
      add :answer_student, :string

      timestamps()
    end
  end
end
