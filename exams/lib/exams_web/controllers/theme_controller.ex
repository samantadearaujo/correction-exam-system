defmodule ExamsWeb.ThemeController do
  use ExamsWeb, :controller

  alias Exams.Templates
  alias Exams.Templates.Theme

  action_fallback ExamsWeb.FallbackController

  def index(conn, _params) do
    themes = Templates.list_themes()
    render(conn, "index.json", themes: themes)
  end

  def create(conn, %{"theme" => theme_params}) do
    with {:ok, %Theme{} = theme} <- Templates.create_theme(theme_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.theme_path(conn, :show, theme))
      |> render("show.json", theme: theme)
    end
  end

  def show(conn, %{"id" => id}) do
    theme = Templates.get_theme!(id)
    render(conn, "show.json", theme: theme)
  end

  def update(conn, %{"id" => id, "theme" => theme_params}) do
    theme = Templates.get_theme!(id)

    with {:ok, %Theme{} = theme} <- Templates.update_theme(theme, theme_params) do
      render(conn, "show.json", theme: theme)
    end
  end

  def delete(conn, %{"id" => id}) do
    theme = Templates.get_theme!(id)

    with {:ok, %Theme{}} <- Templates.delete_theme(theme) do
      send_resp(conn, :no_content, "")
    end
  end
end
