defmodule Exams.Acounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :password, :string
    field :profile, :integer
    field :username, :string
    #has_one :profile, Exams.Acounts.UserProfile

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :username, :password, :profile])
    |> validate_required([:name, :username, :password, :profile])
  end
end
