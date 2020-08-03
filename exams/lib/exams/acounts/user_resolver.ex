defmodule Exams.Acounts.UserResolver do
    alias Exams.{Acounts.User, Repo}

    def all(_args, _info) do
        {:ok,  Repo.all(User)}
    end

    def get_user(_parent, %{id: id}, _resolution) do
        user = Repo.get!(id)
        {:ok, user}
    end
end