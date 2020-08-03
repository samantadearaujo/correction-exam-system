defmodule ExamsWeb.UserProfileView do
  use ExamsWeb, :view
  alias ExamsWeb.UserProfileView

  def render("index.json", %{usersprofiles: usersprofiles}) do
    %{data: render_many(usersprofiles, UserProfileView, "user_profile.json")}
  end

  def render("show.json", %{user_profile: user_profile}) do
    %{data: render_one(user_profile, UserProfileView, "user_profile.json")}
  end

  def render("user_profile.json", %{user_profile: user_profile}) do
    %{id: user_profile.id,
      name: user_profile.name}
  end
end
