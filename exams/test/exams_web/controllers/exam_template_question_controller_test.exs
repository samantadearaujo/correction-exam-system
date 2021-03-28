defmodule ExamsWeb.ExamTemplateQuestionControllerTest do
  use ExamsWeb.ConnCase

  alias Exams.Templates
  alias Exams.Templates.ExamTemplateQuestion

  @create_attrs %{
    answer_correct_id: 42,
    questions: "some questions",
    template_id: 42
  }
  @update_attrs %{
    answer_correct_id: 43,
    questions: "some updated questions",
    template_id: 43
  }
  @invalid_attrs %{answer_correct_id: nil, questions: nil, template_id: nil}

  def fixture(:exam_template_question) do
    {:ok, exam_template_question} = Templates.create_exam_template_question(@create_attrs)
    exam_template_question
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all exams_templates_questions", %{conn: conn} do
      conn = get(conn, Routes.exam_template_question_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create exam_template_question" do
    test "renders exam_template_question when data is valid", %{conn: conn} do
      conn =
        post(conn, Routes.exam_template_question_path(conn, :create),
          exam_template_question: @create_attrs
        )

      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.exam_template_question_path(conn, :show, id))

      assert %{
               "id" => id,
               "answer_correct_id" => 42,
               "questions" => "some questions",
               "template_id" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn =
        post(conn, Routes.exam_template_question_path(conn, :create),
          exam_template_question: @invalid_attrs
        )

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update exam_template_question" do
    setup [:create_exam_template_question]

    test "renders exam_template_question when data is valid", %{
      conn: conn,
      exam_template_question: %ExamTemplateQuestion{id: id} = exam_template_question
    } do
      conn =
        put(conn, Routes.exam_template_question_path(conn, :update, exam_template_question),
          exam_template_question: @update_attrs
        )

      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.exam_template_question_path(conn, :show, id))

      assert %{
               "id" => id,
               "answer_correct_id" => 43,
               "questions" => "some updated questions",
               "template_id" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{
      conn: conn,
      exam_template_question: exam_template_question
    } do
      conn =
        put(conn, Routes.exam_template_question_path(conn, :update, exam_template_question),
          exam_template_question: @invalid_attrs
        )

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete exam_template_question" do
    setup [:create_exam_template_question]

    test "deletes chosen exam_template_question", %{
      conn: conn,
      exam_template_question: exam_template_question
    } do
      conn =
        delete(conn, Routes.exam_template_question_path(conn, :delete, exam_template_question))

      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.exam_template_question_path(conn, :show, exam_template_question))
      end
    end
  end

  defp create_exam_template_question(_) do
    exam_template_question = fixture(:exam_template_question)
    %{exam_template_question: exam_template_question}
  end
end
