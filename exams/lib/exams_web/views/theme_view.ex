defmodule ExamsWeb.ThemeView do
  use ExamsWeb, :view
  alias ExamsWeb.ThemeView

  def render("index.json", %{themes: themes}) do
    %{data: render_many(themes, ThemeView, "theme.json")}
  end

  def render("show.json", %{theme: theme}) do
    %{data: render_one(theme, ThemeView, "theme.json")}
  end

  def render("theme.json", %{theme: theme}) do
    %{id: theme.id,
      name: theme.name}
  end
end
