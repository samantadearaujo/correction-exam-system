defmodule Exams.ExamsTestsTest do
  use Exams.DataCase

  alias Exams.ExamsTests

  describe "tests" do
    alias Exams.ExamsTests.ExamTests

    @valid_attrs %{name: "some name", score_exam: "120.5", template_id: 42, total_question: 42}
    @update_attrs %{name: "some updated name", score_exam: "456.7", template_id: 43, total_question: 43}
    @invalid_attrs %{name: nil, score_exam: nil, template_id: nil, total_question: nil}

    def exam_tests_fixture(attrs \\ %{}) do
      {:ok, exam_tests} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ExamsTests.create_exam_tests()

      exam_tests
    end

    test "list_tests/0 returns all tests" do
      exam_tests = exam_tests_fixture()
      assert ExamsTests.list_tests() == [exam_tests]
    end

    test "get_exam_tests!/1 returns the exam_tests with given id" do
      exam_tests = exam_tests_fixture()
      assert ExamsTests.get_exam_tests!(exam_tests.id) == exam_tests
    end

    test "create_exam_tests/1 with valid data creates a exam_tests" do
      assert {:ok, %ExamTests{} = exam_tests} = ExamsTests.create_exam_tests(@valid_attrs)
      assert exam_tests.name == "some name"
      assert exam_tests.score_exam == Decimal.new("120.5")
      assert exam_tests.template_id == 42
      assert exam_tests.total_question == 42
    end

    test "create_exam_tests/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ExamsTests.create_exam_tests(@invalid_attrs)
    end

    test "update_exam_tests/2 with valid data updates the exam_tests" do
      exam_tests = exam_tests_fixture()
      assert {:ok, %ExamTests{} = exam_tests} = ExamsTests.update_exam_tests(exam_tests, @update_attrs)
      assert exam_tests.name == "some updated name"
      assert exam_tests.score_exam == Decimal.new("456.7")
      assert exam_tests.template_id == 43
      assert exam_tests.total_question == 43
    end

    test "update_exam_tests/2 with invalid data returns error changeset" do
      exam_tests = exam_tests_fixture()
      assert {:error, %Ecto.Changeset{}} = ExamsTests.update_exam_tests(exam_tests, @invalid_attrs)
      assert exam_tests == ExamsTests.get_exam_tests!(exam_tests.id)
    end

    test "delete_exam_tests/1 deletes the exam_tests" do
      exam_tests = exam_tests_fixture()
      assert {:ok, %ExamTests{}} = ExamsTests.delete_exam_tests(exam_tests)
      assert_raise Ecto.NoResultsError, fn -> ExamsTests.get_exam_tests!(exam_tests.id) end
    end

    test "change_exam_tests/1 returns a exam_tests changeset" do
      exam_tests = exam_tests_fixture()
      assert %Ecto.Changeset{} = ExamsTests.change_exam_tests(exam_tests)
    end
  end

  describe "examstudent" do
    alias Exams.ExamsTests.ExamStudent

    @valid_attrs %{answer_student: "some answer_student", exam_id: 42, question_student: "some question_student", student_id: 42}
    @update_attrs %{answer_student: "some updated answer_student", exam_id: 43, question_student: "some updated question_student", student_id: 43}
    @invalid_attrs %{answer_student: nil, exam_id: nil, question_student: nil, student_id: nil}

    def exam_student_fixture(attrs \\ %{}) do
      {:ok, exam_student} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ExamsTests.create_exam_student()

      exam_student
    end

    test "list_examstudent/0 returns all examstudent" do
      exam_student = exam_student_fixture()
      assert ExamsTests.list_examstudent() == [exam_student]
    end

    test "get_exam_student!/1 returns the exam_student with given id" do
      exam_student = exam_student_fixture()
      assert ExamsTests.get_exam_student!(exam_student.id) == exam_student
    end

    test "create_exam_student/1 with valid data creates a exam_student" do
      assert {:ok, %ExamStudent{} = exam_student} = ExamsTests.create_exam_student(@valid_attrs)
      assert exam_student.answer_student == "some answer_student"
      assert exam_student.exam_id == 42
      assert exam_student.question_student == "some question_student"
      assert exam_student.student_id == 42
    end

    test "create_exam_student/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ExamsTests.create_exam_student(@invalid_attrs)
    end

    test "update_exam_student/2 with valid data updates the exam_student" do
      exam_student = exam_student_fixture()
      assert {:ok, %ExamStudent{} = exam_student} = ExamsTests.update_exam_student(exam_student, @update_attrs)
      assert exam_student.answer_student == "some updated answer_student"
      assert exam_student.exam_id == 43
      assert exam_student.question_student == "some updated question_student"
      assert exam_student.student_id == 43
    end

    test "update_exam_student/2 with invalid data returns error changeset" do
      exam_student = exam_student_fixture()
      assert {:error, %Ecto.Changeset{}} = ExamsTests.update_exam_student(exam_student, @invalid_attrs)
      assert exam_student == ExamsTests.get_exam_student!(exam_student.id)
    end

    test "delete_exam_student/1 deletes the exam_student" do
      exam_student = exam_student_fixture()
      assert {:ok, %ExamStudent{}} = ExamsTests.delete_exam_student(exam_student)
      assert_raise Ecto.NoResultsError, fn -> ExamsTests.get_exam_student!(exam_student.id) end
    end

    test "change_exam_student/1 returns a exam_student changeset" do
      exam_student = exam_student_fixture()
      assert %Ecto.Changeset{} = ExamsTests.change_exam_student(exam_student)
    end
  end
end
