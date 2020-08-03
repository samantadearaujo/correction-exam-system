defmodule Exams.ExamsTests do
  @moduledoc """
  The ExamsTests context.
  """

  import Ecto.Query, warn: false
  alias Exams.Repo

  alias Exams.ExamsTests.ExamTests

  @doc """
  Returns the list of tests.

  ## Examples

      iex> list_tests()
      [%ExamTests{}, ...]

  """
  def list_tests do
    Repo.all(ExamTests)
  end

  @doc """
  Gets a single exam_tests.

  Raises `Ecto.NoResultsError` if the Exam tests does not exist.

  ## Examples

      iex> get_exam_tests!(123)
      %ExamTests{}

      iex> get_exam_tests!(456)
      ** (Ecto.NoResultsError)

  """
  def get_exam_tests!(id), do: Repo.get!(ExamTests, id)

  @doc """
  Creates a exam_tests.

  ## Examples

      iex> create_exam_tests(%{field: value})
      {:ok, %ExamTests{}}

      iex> create_exam_tests(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_exam_tests(attrs \\ %{}) do
    %ExamTests{}
    |> ExamTests.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a exam_tests.

  ## Examples

      iex> update_exam_tests(exam_tests, %{field: new_value})
      {:ok, %ExamTests{}}

      iex> update_exam_tests(exam_tests, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_exam_tests(%ExamTests{} = exam_tests, attrs) do
    exam_tests
    |> ExamTests.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a exam_tests.

  ## Examples

      iex> delete_exam_tests(exam_tests)
      {:ok, %ExamTests{}}

      iex> delete_exam_tests(exam_tests)
      {:error, %Ecto.Changeset{}}

  """
  def delete_exam_tests(%ExamTests{} = exam_tests) do
    Repo.delete(exam_tests)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking exam_tests changes.

  ## Examples

      iex> change_exam_tests(exam_tests)
      %Ecto.Changeset{data: %ExamTests{}}

  """
  def change_exam_tests(%ExamTests{} = exam_tests, attrs \\ %{}) do
    ExamTests.changeset(exam_tests, attrs)
  end

  alias Exams.ExamsTests.ExamStudent

  @doc """
  Returns the list of examstudent.

  ## Examples

      iex> list_examstudent()
      [%ExamStudent{}, ...]

  """
  def list_examstudent do
    Repo.all(ExamStudent)
  end

  @doc """
  Gets a single exam_student.

  Raises `Ecto.NoResultsError` if the Exam student does not exist.

  ## Examples

      iex> get_exam_student!(123)
      %ExamStudent{}

      iex> get_exam_student!(456)
      ** (Ecto.NoResultsError)

  """
  def get_exam_student!(id), do: Repo.get!(ExamStudent, id)

  @doc """
  Creates a exam_student.

  ## Examples

      iex> create_exam_student(%{field: value})
      {:ok, %ExamStudent{}}

      iex> create_exam_student(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_exam_student(attrs \\ %{}) do
    %ExamStudent{}
    |> ExamStudent.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a exam_student.

  ## Examples

      iex> update_exam_student(exam_student, %{field: new_value})
      {:ok, %ExamStudent{}}

      iex> update_exam_student(exam_student, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_exam_student(%ExamStudent{} = exam_student, attrs) do
    exam_student
    |> ExamStudent.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a exam_student.

  ## Examples

      iex> delete_exam_student(exam_student)
      {:ok, %ExamStudent{}}

      iex> delete_exam_student(exam_student)
      {:error, %Ecto.Changeset{}}

  """
  def delete_exam_student(%ExamStudent{} = exam_student) do
    Repo.delete(exam_student)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking exam_student changes.

  ## Examples

      iex> change_exam_student(exam_student)
      %Ecto.Changeset{data: %ExamStudent{}}

  """
  def change_exam_student(%ExamStudent{} = exam_student, attrs \\ %{}) do
    ExamStudent.changeset(exam_student, attrs)
  end
end
