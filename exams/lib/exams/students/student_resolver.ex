defmodule Exams.Students.StudentsResolver do
    alias Exams.{Students.Student, Repo}

    def all(_args, _info) do
        {:ok,  Repo.all(Student)}
    end
end