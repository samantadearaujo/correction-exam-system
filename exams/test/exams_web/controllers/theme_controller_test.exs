defmodule ExamsWeb.ThemeControllerTest do
  use ExamsWeb.ConnCase

  alias Exams.Templates
  alias Exams.Templates.Theme

  @create_attrs %{
    name: "some name"
  }
  @update_attrs %{
    name: "some updated name"
  }
  @invalid_attrs %{name: nil}

  def fixture(:theme) do
    {:ok, theme} = Templates.create_theme(@create_attrs)
    theme
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all themes", %{conn: conn} do
      conn = get(conn, Routes.theme_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create theme" do
    test "renders theme when data is valid", %{conn: conn} do
      conn = post(conn, Routes.theme_path(conn, :create), theme: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.theme_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.theme_path(conn, :create), theme: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update theme" do
    setup [:create_theme]

    test "renders theme when data is valid", %{conn: conn, theme: %Theme{id: id} = theme} do
      conn = put(conn, Routes.theme_path(conn, :update, theme), theme: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.theme_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, theme: theme} do
      conn = put(conn, Routes.theme_path(conn, :update, theme), theme: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete theme" do
    setup [:create_theme]

    test "deletes chosen theme", %{conn: conn, theme: theme} do
      conn = delete(conn, Routes.theme_path(conn, :delete, theme))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.theme_path(conn, :show, theme))
      end
    end
  end

  defp create_theme(_) do
    theme = fixture(:theme)
    %{theme: theme}
  end
end
