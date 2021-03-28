defmodule Exams.TemplatesTest do
  use Exams.DataCase

  alias Exams.Templates

  describe "themes" do
    alias Exams.Templates.Theme

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def theme_fixture(attrs \\ %{}) do
      {:ok, theme} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Templates.create_theme()

      theme
    end

    test "list_themes/0 returns all themes" do
      theme = theme_fixture()
      assert Templates.list_themes() == [theme]
    end

    test "get_theme!/1 returns the theme with given id" do
      theme = theme_fixture()
      assert Templates.get_theme!(theme.id) == theme
    end

    test "create_theme/1 with valid data creates a theme" do
      assert {:ok, %Theme{} = theme} = Templates.create_theme(@valid_attrs)
      assert theme.name == "some name"
    end

    test "create_theme/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Templates.create_theme(@invalid_attrs)
    end

    test "update_theme/2 with valid data updates the theme" do
      theme = theme_fixture()
      assert {:ok, %Theme{} = theme} = Templates.update_theme(theme, @update_attrs)
      assert theme.name == "some updated name"
    end

    test "update_theme/2 with invalid data returns error changeset" do
      theme = theme_fixture()
      assert {:error, %Ecto.Changeset{}} = Templates.update_theme(theme, @invalid_attrs)
      assert theme == Templates.get_theme!(theme.id)
    end

    test "delete_theme/1 deletes the theme" do
      theme = theme_fixture()
      assert {:ok, %Theme{}} = Templates.delete_theme(theme)
      assert_raise Ecto.NoResultsError, fn -> Templates.get_theme!(theme.id) end
    end

    test "change_theme/1 returns a theme changeset" do
      theme = theme_fixture()
      assert %Ecto.Changeset{} = Templates.change_theme(theme)
    end
  end

  describe "exams_templates" do
    alias Exams.Templates.ExamTemplate

    @valid_attrs %{quarter: 42, teacher_id: 42, theme_id: 42}
    @update_attrs %{quarter: 43, teacher_id: 43, theme_id: 43}
    @invalid_attrs %{quarter: nil, teacher_id: nil, theme_id: nil}

    def exam_template_fixture(attrs \\ %{}) do
      {:ok, exam_template} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Templates.create_exam_template()

      exam_template
    end

    test "list_exams_templates/0 returns all exams_templates" do
      exam_template = exam_template_fixture()
      assert Templates.list_exams_templates() == [exam_template]
    end

    test "get_exam_template!/1 returns the exam_template with given id" do
      exam_template = exam_template_fixture()
      assert Templates.get_exam_template!(exam_template.id) == exam_template
    end

    test "create_exam_template/1 with valid data creates a exam_template" do
      assert {:ok, %ExamTemplate{} = exam_template} = Templates.create_exam_template(@valid_attrs)
      assert exam_template.quarter == 42
      assert exam_template.teacher_id == 42
      assert exam_template.theme_id == 42
    end

    test "create_exam_template/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Templates.create_exam_template(@invalid_attrs)
    end

    test "update_exam_template/2 with valid data updates the exam_template" do
      exam_template = exam_template_fixture()

      assert {:ok, %ExamTemplate{} = exam_template} =
               Templates.update_exam_template(exam_template, @update_attrs)

      assert exam_template.quarter == 43
      assert exam_template.teacher_id == 43
      assert exam_template.theme_id == 43
    end

    test "update_exam_template/2 with invalid data returns error changeset" do
      exam_template = exam_template_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Templates.update_exam_template(exam_template, @invalid_attrs)

      assert exam_template == Templates.get_exam_template!(exam_template.id)
    end

    test "delete_exam_template/1 deletes the exam_template" do
      exam_template = exam_template_fixture()
      assert {:ok, %ExamTemplate{}} = Templates.delete_exam_template(exam_template)
      assert_raise Ecto.NoResultsError, fn -> Templates.get_exam_template!(exam_template.id) end
    end

    test "change_exam_template/1 returns a exam_template changeset" do
      exam_template = exam_template_fixture()
      assert %Ecto.Changeset{} = Templates.change_exam_template(exam_template)
    end
  end

  describe "exams_templates_questions" do
    alias Exams.Templates.ExamTemplateQuestion

    @valid_attrs %{answer_correct_id: 42, questions: "some questions", template_id: 42}
    @update_attrs %{answer_correct_id: 43, questions: "some updated questions", template_id: 43}
    @invalid_attrs %{answer_correct_id: nil, questions: nil, template_id: nil}

    def exam_template_question_fixture(attrs \\ %{}) do
      {:ok, exam_template_question} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Templates.create_exam_template_question()

      exam_template_question
    end

    test "list_exams_templates_questions/0 returns all exams_templates_questions" do
      exam_template_question = exam_template_question_fixture()
      assert Templates.list_exams_templates_questions() == [exam_template_question]
    end

    test "get_exam_template_question!/1 returns the exam_template_question with given id" do
      exam_template_question = exam_template_question_fixture()

      assert Templates.get_exam_template_question!(exam_template_question.id) ==
               exam_template_question
    end

    test "create_exam_template_question/1 with valid data creates a exam_template_question" do
      assert {:ok, %ExamTemplateQuestion{} = exam_template_question} =
               Templates.create_exam_template_question(@valid_attrs)

      assert exam_template_question.answer_correct_id == 42
      assert exam_template_question.questions == "some questions"
      assert exam_template_question.template_id == 42
    end

    test "create_exam_template_question/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Templates.create_exam_template_question(@invalid_attrs)
    end

    test "update_exam_template_question/2 with valid data updates the exam_template_question" do
      exam_template_question = exam_template_question_fixture()

      assert {:ok, %ExamTemplateQuestion{} = exam_template_question} =
               Templates.update_exam_template_question(exam_template_question, @update_attrs)

      assert exam_template_question.answer_correct_id == 43
      assert exam_template_question.questions == "some updated questions"
      assert exam_template_question.template_id == 43
    end

    test "update_exam_template_question/2 with invalid data returns error changeset" do
      exam_template_question = exam_template_question_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Templates.update_exam_template_question(exam_template_question, @invalid_attrs)

      assert exam_template_question ==
               Templates.get_exam_template_question!(exam_template_question.id)
    end

    test "delete_exam_template_question/1 deletes the exam_template_question" do
      exam_template_question = exam_template_question_fixture()

      assert {:ok, %ExamTemplateQuestion{}} =
               Templates.delete_exam_template_question(exam_template_question)

      assert_raise Ecto.NoResultsError, fn ->
        Templates.get_exam_template_question!(exam_template_question.id)
      end
    end

    test "change_exam_template_question/1 returns a exam_template_question changeset" do
      exam_template_question = exam_template_question_fixture()
      assert %Ecto.Changeset{} = Templates.change_exam_template_question(exam_template_question)
    end
  end

  describe "exams_templates_answers" do
    alias Exams.Templates.ExamTemplateAnswer

    @valid_attrs %{answers: "some answers", question_id: 42}
    @update_attrs %{answers: "some updated answers", question_id: 43}
    @invalid_attrs %{answers: nil, question_id: nil}

    def exam_template_answer_fixture(attrs \\ %{}) do
      {:ok, exam_template_answer} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Templates.create_exam_template_answer()

      exam_template_answer
    end

    test "list_exams_templates_answers/0 returns all exams_templates_answers" do
      exam_template_answer = exam_template_answer_fixture()
      assert Templates.list_exams_templates_answers() == [exam_template_answer]
    end

    test "get_exam_template_answer!/1 returns the exam_template_answer with given id" do
      exam_template_answer = exam_template_answer_fixture()
      assert Templates.get_exam_template_answer!(exam_template_answer.id) == exam_template_answer
    end

    test "create_exam_template_answer/1 with valid data creates a exam_template_answer" do
      assert {:ok, %ExamTemplateAnswer{} = exam_template_answer} =
               Templates.create_exam_template_answer(@valid_attrs)

      assert exam_template_answer.answers == "some answers"
      assert exam_template_answer.question_id == 42
    end

    test "create_exam_template_answer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Templates.create_exam_template_answer(@invalid_attrs)
    end

    test "update_exam_template_answer/2 with valid data updates the exam_template_answer" do
      exam_template_answer = exam_template_answer_fixture()

      assert {:ok, %ExamTemplateAnswer{} = exam_template_answer} =
               Templates.update_exam_template_answer(exam_template_answer, @update_attrs)

      assert exam_template_answer.answers == "some updated answers"
      assert exam_template_answer.question_id == 43
    end

    test "update_exam_template_answer/2 with invalid data returns error changeset" do
      exam_template_answer = exam_template_answer_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Templates.update_exam_template_answer(exam_template_answer, @invalid_attrs)

      assert exam_template_answer == Templates.get_exam_template_answer!(exam_template_answer.id)
    end

    test "delete_exam_template_answer/1 deletes the exam_template_answer" do
      exam_template_answer = exam_template_answer_fixture()

      assert {:ok, %ExamTemplateAnswer{}} =
               Templates.delete_exam_template_answer(exam_template_answer)

      assert_raise Ecto.NoResultsError, fn ->
        Templates.get_exam_template_answer!(exam_template_answer.id)
      end
    end

    test "change_exam_template_answer/1 returns a exam_template_answer changeset" do
      exam_template_answer = exam_template_answer_fixture()
      assert %Ecto.Changeset{} = Templates.change_exam_template_answer(exam_template_answer)
    end
  end
end
