defmodule Exams.Repo.Migrations.CreateUsersprofiles do
  @moduledoc """
  Essa tabela define os tipos de usuarios. 
  Dois tipos já definido [Teacher = Professor; Student = estudantes]
  """
  use Ecto.Migration

  def change do
    create table(:usersprofiles) do
      add :name, :string

      timestamps()
    end
  end
end
