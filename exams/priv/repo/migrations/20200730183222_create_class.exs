defmodule Exams.Repo.Migrations.CreateClass do
  @moduledoc """
  Define apenas o Profile Teacher, pode criar classes. 
  São colocados as classes, para associar os students e os exames
  """
  use Ecto.Migration

  def change do
    create table(:class) do
      add :teacher_id, :integer
      add :year, :integer
      add :academic, :integer
      add :name, :string
      add :description, :string
      add :created_by, :integer
      add :modified_by, :integer
      add :id_exam, :integer

      timestamps()
    end
  end
end
