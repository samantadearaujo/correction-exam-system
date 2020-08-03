defmodule ExamsWeb.UserProfileController do
  use ExamsWeb, :controller

  alias Exams.Acounts
  alias Exams.Acounts.UserProfile

  action_fallback ExamsWeb.FallbackController

  def index(conn, _params) do
    usersprofiles = Acounts.list_usersprofiles()
    render(conn, "index.json", usersprofiles: usersprofiles)
  end

  def create(conn, %{"user_profile" => user_profile_params}) do
    with {:ok, %UserProfile{} = user_profile} <- Acounts.create_user_profile(user_profile_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_profile_path(conn, :show, user_profile))
      |> render("show.json", user_profile: user_profile)
    end
  end

  def show(conn, %{"id" => id}) do
    user_profile = Acounts.get_user_profile!(id)
    render(conn, "show.json", user_profile: user_profile)
  end

  def update(conn, %{"id" => id, "user_profile" => user_profile_params}) do
    user_profile = Acounts.get_user_profile!(id)

    with {:ok, %UserProfile{} = user_profile} <- Acounts.update_user_profile(user_profile, user_profile_params) do
      render(conn, "show.json", user_profile: user_profile)
    end
  end

  def delete(conn, %{"id" => id}) do
    user_profile = Acounts.get_user_profile!(id)

    with {:ok, %UserProfile{}} <- Acounts.delete_user_profile(user_profile) do
      send_resp(conn, :no_content, "")
    end
  end
end
