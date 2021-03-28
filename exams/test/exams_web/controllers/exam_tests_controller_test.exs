defmodule ExamsWeb.ExamTestsControllerTest do
  use ExamsWeb.ConnCase

  alias Exams.ExamsTests
  alias Exams.ExamsTests.ExamTests

  @create_attrs %{
    name: "some name",
    score_exam: "120.5",
    template_id: 42,
    total_question: 42
  }
  @update_attrs %{
    name: "some updated name",
    score_exam: "456.7",
    template_id: 43,
    total_question: 43
  }
  @invalid_attrs %{name: nil, score_exam: nil, template_id: nil, total_question: nil}

  def fixture(:exam_tests) do
    {:ok, exam_tests} = ExamsTests.create_exam_tests(@create_attrs)
    exam_tests
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all tests", %{conn: conn} do
      conn = get(conn, Routes.exam_tests_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create exam_tests" do
    test "renders exam_tests when data is valid", %{conn: conn} do
      conn = post(conn, Routes.exam_tests_path(conn, :create), exam_tests: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.exam_tests_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some name",
               "score_exam" => "120.5",
               "template_id" => 42,
               "total_question" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.exam_tests_path(conn, :create), exam_tests: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update exam_tests" do
    setup [:create_exam_tests]

    test "renders exam_tests when data is valid", %{
      conn: conn,
      exam_tests: %ExamTests{id: id} = exam_tests
    } do
      conn =
        put(conn, Routes.exam_tests_path(conn, :update, exam_tests), exam_tests: @update_attrs)

      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.exam_tests_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some updated name",
               "score_exam" => "456.7",
               "template_id" => 43,
               "total_question" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, exam_tests: exam_tests} do
      conn =
        put(conn, Routes.exam_tests_path(conn, :update, exam_tests), exam_tests: @invalid_attrs)

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete exam_tests" do
    setup [:create_exam_tests]

    test "deletes chosen exam_tests", %{conn: conn, exam_tests: exam_tests} do
      conn = delete(conn, Routes.exam_tests_path(conn, :delete, exam_tests))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.exam_tests_path(conn, :show, exam_tests))
      end
    end
  end

  defp create_exam_tests(_) do
    exam_tests = fixture(:exam_tests)
    %{exam_tests: exam_tests}
  end
end
