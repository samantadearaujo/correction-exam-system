defmodule Exams.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  @moduledoc """
    Usuários de todos os tipos, sendo Profile (2) => Professor 
      onde username para Teacher = CPF. 
      Já Profile (3) => Estudante username = code [ANO+CLASS+Numero] 
  """

  def change do
    create table(:users) do
      add :name, :string
      add :username, :string
      add :password_hash, :string
      # add :profile_id, references(:usersprofiles)
      add :profile, :integer

      timestamps()
    end

    # create unique_index(:users, [:profile])
  end
end
