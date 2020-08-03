defmodule ExamsWeb.Schema do
    use Absinthe.Schema
    import_types ExamsWeb.Schema.Types

    query do
        field :acounts_users, list_of(:acounts_user) do
            resolve &Exams.Acounts.UserResolver.all/2
        end

        field :students_users, list_of(:students_user) do
            resolve &Exams.Students.StudentsResolver.all/2
        end
    end
end