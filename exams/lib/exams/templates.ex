defmodule Exams.Templates do
  @moduledoc """
  The Templates context.
  """

  import Ecto.Query, warn: false
  alias Exams.Repo

  alias Exams.Templates.Theme

  @doc """
  Returns the list of themes.

  ## Examples

      iex> list_themes()
      [%Theme{}, ...]

  """
  def list_themes do
    Repo.all(Theme)
  end

  @doc """
  Gets a single theme.

  Raises `Ecto.NoResultsError` if the Theme does not exist.

  ## Examples

      iex> get_theme!(123)
      %Theme{}

      iex> get_theme!(456)
      ** (Ecto.NoResultsError)

  """
  def get_theme!(id), do: Repo.get!(Theme, id)

  @doc """
  Creates a theme.

  ## Examples

      iex> create_theme(%{field: value})
      {:ok, %Theme{}}

      iex> create_theme(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_theme(attrs \\ %{}) do
    %Theme{}
    |> Theme.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a theme.

  ## Examples

      iex> update_theme(theme, %{field: new_value})
      {:ok, %Theme{}}

      iex> update_theme(theme, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_theme(%Theme{} = theme, attrs) do
    theme
    |> Theme.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a theme.

  ## Examples

      iex> delete_theme(theme)
      {:ok, %Theme{}}

      iex> delete_theme(theme)
      {:error, %Ecto.Changeset{}}

  """
  def delete_theme(%Theme{} = theme) do
    Repo.delete(theme)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking theme changes.

  ## Examples

      iex> change_theme(theme)
      %Ecto.Changeset{data: %Theme{}}

  """
  def change_theme(%Theme{} = theme, attrs \\ %{}) do
    Theme.changeset(theme, attrs)
  end

  alias Exams.Templates.ExamTemplate

  @doc """
  Returns the list of exams_templates.

  ## Examples

      iex> list_exams_templates()
      [%ExamTemplate{}, ...]

  """
  def list_exams_templates do
    Repo.all(ExamTemplate)
  end

  @doc """
  Gets a single exam_template.

  Raises `Ecto.NoResultsError` if the Exam template does not exist.

  ## Examples

      iex> get_exam_template!(123)
      %ExamTemplate{}

      iex> get_exam_template!(456)
      ** (Ecto.NoResultsError)

  """
  def get_exam_template!(id), do: Repo.get!(ExamTemplate, id)

  @doc """
  Creates a exam_template.

  ## Examples

      iex> create_exam_template(%{field: value})
      {:ok, %ExamTemplate{}}

      iex> create_exam_template(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_exam_template(attrs \\ %{}) do
    %ExamTemplate{}
    |> ExamTemplate.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a exam_template.

  ## Examples

      iex> update_exam_template(exam_template, %{field: new_value})
      {:ok, %ExamTemplate{}}

      iex> update_exam_template(exam_template, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_exam_template(%ExamTemplate{} = exam_template, attrs) do
    exam_template
    |> ExamTemplate.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a exam_template.

  ## Examples

      iex> delete_exam_template(exam_template)
      {:ok, %ExamTemplate{}}

      iex> delete_exam_template(exam_template)
      {:error, %Ecto.Changeset{}}

  """
  def delete_exam_template(%ExamTemplate{} = exam_template) do
    Repo.delete(exam_template)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking exam_template changes.

  ## Examples

      iex> change_exam_template(exam_template)
      %Ecto.Changeset{data: %ExamTemplate{}}

  """
  def change_exam_template(%ExamTemplate{} = exam_template, attrs \\ %{}) do
    ExamTemplate.changeset(exam_template, attrs)
  end

  alias Exams.Templates.ExamTemplateQuestion

  @doc """
  Returns the list of exams_templates_questions.

  ## Examples

      iex> list_exams_templates_questions()
      [%ExamTemplateQuestion{}, ...]

  """
  def list_exams_templates_questions do
    Repo.all(ExamTemplateQuestion)
  end

  @doc """
  Gets a single exam_template_question.

  Raises `Ecto.NoResultsError` if the Exam template question does not exist.

  ## Examples

      iex> get_exam_template_question!(123)
      %ExamTemplateQuestion{}

      iex> get_exam_template_question!(456)
      ** (Ecto.NoResultsError)

  """
  def get_exam_template_question!(id), do: Repo.get!(ExamTemplateQuestion, id)

  @doc """
  Creates a exam_template_question.

  ## Examples

      iex> create_exam_template_question(%{field: value})
      {:ok, %ExamTemplateQuestion{}}

      iex> create_exam_template_question(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_exam_template_question(attrs \\ %{}) do
    %ExamTemplateQuestion{}
    |> ExamTemplateQuestion.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a exam_template_question.

  ## Examples

      iex> update_exam_template_question(exam_template_question, %{field: new_value})
      {:ok, %ExamTemplateQuestion{}}

      iex> update_exam_template_question(exam_template_question, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_exam_template_question(%ExamTemplateQuestion{} = exam_template_question, attrs) do
    exam_template_question
    |> ExamTemplateQuestion.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a exam_template_question.

  ## Examples

      iex> delete_exam_template_question(exam_template_question)
      {:ok, %ExamTemplateQuestion{}}

      iex> delete_exam_template_question(exam_template_question)
      {:error, %Ecto.Changeset{}}

  """
  def delete_exam_template_question(%ExamTemplateQuestion{} = exam_template_question) do
    Repo.delete(exam_template_question)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking exam_template_question changes.

  ## Examples

      iex> change_exam_template_question(exam_template_question)
      %Ecto.Changeset{data: %ExamTemplateQuestion{}}

  """
  def change_exam_template_question(%ExamTemplateQuestion{} = exam_template_question, attrs \\ %{}) do
    ExamTemplateQuestion.changeset(exam_template_question, attrs)
  end

  alias Exams.Templates.ExamTemplateAnswer

  @doc """
  Returns the list of exams_templates_answers.

  ## Examples

      iex> list_exams_templates_answers()
      [%ExamTemplateAnswer{}, ...]

  """
  def list_exams_templates_answers do
    Repo.all(ExamTemplateAnswer)
  end

  @doc """
  Gets a single exam_template_answer.

  Raises `Ecto.NoResultsError` if the Exam template answer does not exist.

  ## Examples

      iex> get_exam_template_answer!(123)
      %ExamTemplateAnswer{}

      iex> get_exam_template_answer!(456)
      ** (Ecto.NoResultsError)

  """
  def get_exam_template_answer!(id), do: Repo.get!(ExamTemplateAnswer, id)

  @doc """
  Creates a exam_template_answer.

  ## Examples

      iex> create_exam_template_answer(%{field: value})
      {:ok, %ExamTemplateAnswer{}}

      iex> create_exam_template_answer(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_exam_template_answer(attrs \\ %{}) do
    %ExamTemplateAnswer{}
    |> ExamTemplateAnswer.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a exam_template_answer.

  ## Examples

      iex> update_exam_template_answer(exam_template_answer, %{field: new_value})
      {:ok, %ExamTemplateAnswer{}}

      iex> update_exam_template_answer(exam_template_answer, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_exam_template_answer(%ExamTemplateAnswer{} = exam_template_answer, attrs) do
    exam_template_answer
    |> ExamTemplateAnswer.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a exam_template_answer.

  ## Examples

      iex> delete_exam_template_answer(exam_template_answer)
      {:ok, %ExamTemplateAnswer{}}

      iex> delete_exam_template_answer(exam_template_answer)
      {:error, %Ecto.Changeset{}}

  """
  def delete_exam_template_answer(%ExamTemplateAnswer{} = exam_template_answer) do
    Repo.delete(exam_template_answer)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking exam_template_answer changes.

  ## Examples

      iex> change_exam_template_answer(exam_template_answer)
      %Ecto.Changeset{data: %ExamTemplateAnswer{}}

  """
  def change_exam_template_answer(%ExamTemplateAnswer{} = exam_template_answer, attrs \\ %{}) do
    ExamTemplateAnswer.changeset(exam_template_answer, attrs)
  end
end
