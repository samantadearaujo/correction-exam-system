defmodule Exams.Classes.Class do
  use Ecto.Schema
  import Ecto.Changeset

  schema "class" do
    field :academic, :integer
    field :created_by, :integer
    field :description, :string
    field :id_exam, :integer
    field :modified_by, :integer
    field :name, :string
    field :teacher_id, :integer
    field :year, :integer

    timestamps()
  end

  @doc false
  def changeset(class, attrs) do
    class
    |> cast(attrs, [:teacher_id, :year, :academic, :name, :description, :created_by, :modified_by, :id_exam])
    |> validate_required([:teacher_id, :year, :academic, :name, :description, :created_by, :modified_by, :id_exam])
  end
end
