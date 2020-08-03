defmodule ExamsWeb.Router do
  use ExamsWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ExamsWeb do
    pipe_through :api

    resources "/usersprofiles", UserProfileController, only: [:show, :index]
    resources "/users", UserController, only: [:show, :index, :create, :delete, :update]
    resources "/students" , StudentController, only: [:show, :index, :create, :delete, :update]
    resources "/classes" , ClassController, only: [:show, :index, :create, :delete, :update]
    resources "/themes", ThemeController, only: [:show, :index, :create, :delete, :update]
    resources "/templates", ExamTemplateController, only: [:show, :index, :create, :delete, :update]
    resources "/questions" , ExamTemplateQuestionController, only: [:show, :index, :create, :delete, :update]
    resources "/answers" , ExamTemplateAnswerController, only: [:show, :index, :create, :delete, :update]
    resources "/exams" , ExamTestsController, only: [:show, :index, :create, :delete, :update]

    end
    forward "/graph", Absinthe.Plug,
      schema: ExamsWeb.Schema
  
    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: ExamsWeb.Schema
end
