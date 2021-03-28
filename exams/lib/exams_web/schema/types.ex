defmodule ExamsWeb.Schema.Types do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: Exams.Repo

  object :Accounts_user do
    field :id, :id
    field :name, :string
    field :password, :string
    field :profile, :integer
    field :username, :string

    # field :students_user, list_of(:students_user), resolve: assoc(:students_user)
  end

  object :students_user do
    field :id, :id
    field :class_id, :integer
    field :exam_id, :integer
    field :score, :string
    field :student_id, :id
  end
end
