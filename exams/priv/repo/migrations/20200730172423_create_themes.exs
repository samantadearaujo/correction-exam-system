defmodule Exams.Repo.Migrations.CreateThemes do
  @moduledoc """
    Define as matérias. Ex.: Portugues...Matemática... 
  """
  use Ecto.Migration

  def change do
    create table(:themes) do
      add :name, :string

      timestamps()
    end

  end
end
