defmodule ExamsWeb.ExamTemplateAnswerControllerTest do
  use ExamsWeb.ConnCase

  alias Exams.Templates
  alias Exams.Templates.ExamTemplateAnswer

  @create_attrs %{
    answers: "some answers",
    question_id: 42
  }
  @update_attrs %{
    answers: "some updated answers",
    question_id: 43
  }
  @invalid_attrs %{answers: nil, question_id: nil}

  def fixture(:exam_template_answer) do
    {:ok, exam_template_answer} = Templates.create_exam_template_answer(@create_attrs)
    exam_template_answer
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all exams_templates_answers", %{conn: conn} do
      conn = get(conn, Routes.exam_template_answer_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create exam_template_answer" do
    test "renders exam_template_answer when data is valid", %{conn: conn} do
      conn =
        post(conn, Routes.exam_template_answer_path(conn, :create),
          exam_template_answer: @create_attrs
        )

      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.exam_template_answer_path(conn, :show, id))

      assert %{
               "id" => id,
               "answers" => "some answers",
               "question_id" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn =
        post(conn, Routes.exam_template_answer_path(conn, :create),
          exam_template_answer: @invalid_attrs
        )

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update exam_template_answer" do
    setup [:create_exam_template_answer]

    test "renders exam_template_answer when data is valid", %{
      conn: conn,
      exam_template_answer: %ExamTemplateAnswer{id: id} = exam_template_answer
    } do
      conn =
        put(conn, Routes.exam_template_answer_path(conn, :update, exam_template_answer),
          exam_template_answer: @update_attrs
        )

      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.exam_template_answer_path(conn, :show, id))

      assert %{
               "id" => id,
               "answers" => "some updated answers",
               "question_id" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{
      conn: conn,
      exam_template_answer: exam_template_answer
    } do
      conn =
        put(conn, Routes.exam_template_answer_path(conn, :update, exam_template_answer),
          exam_template_answer: @invalid_attrs
        )

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete exam_template_answer" do
    setup [:create_exam_template_answer]

    test "deletes chosen exam_template_answer", %{
      conn: conn,
      exam_template_answer: exam_template_answer
    } do
      conn = delete(conn, Routes.exam_template_answer_path(conn, :delete, exam_template_answer))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.exam_template_answer_path(conn, :show, exam_template_answer))
      end
    end
  end

  defp create_exam_template_answer(_) do
    exam_template_answer = fixture(:exam_template_answer)
    %{exam_template_answer: exam_template_answer}
  end
end
