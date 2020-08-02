defmodule Exams.Repo.Migrations.CreateUsersprofiles do
  use Ecto.Migration

  def change do
    create table(:usersprofiles) do
      add :name, :string

      timestamps()
    end

  end
end
