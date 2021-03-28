defmodule ExamsWeb.ExamTemplateControllerTest do
  use ExamsWeb.ConnCase

  alias Exams.Templates
  alias Exams.Templates.ExamTemplate

  @create_attrs %{
    quarter: 42,
    teacher_id: 42,
    theme_id: 42
  }
  @update_attrs %{
    quarter: 43,
    teacher_id: 43,
    theme_id: 43
  }
  @invalid_attrs %{quarter: nil, teacher_id: nil, theme_id: nil}

  def fixture(:exam_template) do
    {:ok, exam_template} = Templates.create_exam_template(@create_attrs)
    exam_template
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all exams_templates", %{conn: conn} do
      conn = get(conn, Routes.exam_template_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create exam_template" do
    test "renders exam_template when data is valid", %{conn: conn} do
      conn = post(conn, Routes.exam_template_path(conn, :create), exam_template: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.exam_template_path(conn, :show, id))

      assert %{
               "id" => id,
               "quarter" => 42,
               "teacher_id" => 42,
               "theme_id" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.exam_template_path(conn, :create), exam_template: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update exam_template" do
    setup [:create_exam_template]

    test "renders exam_template when data is valid", %{
      conn: conn,
      exam_template: %ExamTemplate{id: id} = exam_template
    } do
      conn =
        put(conn, Routes.exam_template_path(conn, :update, exam_template),
          exam_template: @update_attrs
        )

      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.exam_template_path(conn, :show, id))

      assert %{
               "id" => id,
               "quarter" => 43,
               "teacher_id" => 43,
               "theme_id" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, exam_template: exam_template} do
      conn =
        put(conn, Routes.exam_template_path(conn, :update, exam_template),
          exam_template: @invalid_attrs
        )

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete exam_template" do
    setup [:create_exam_template]

    test "deletes chosen exam_template", %{conn: conn, exam_template: exam_template} do
      conn = delete(conn, Routes.exam_template_path(conn, :delete, exam_template))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.exam_template_path(conn, :show, exam_template))
      end
    end
  end

  defp create_exam_template(_) do
    exam_template = fixture(:exam_template)
    %{exam_template: exam_template}
  end
end
