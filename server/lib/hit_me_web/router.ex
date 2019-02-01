defmodule HitMeWeb.Router do
  use HitMeWeb, :router

  pipeline :api do
    plug :accepts, ["json-api"]
    plug JaSerializer.ContentTypeNegotiation
    plug JaSerializer.Deserializer
  end

  scope "/api", HitMeWeb do
    pipe_through :api

    resources "/milestones", MilestoneController, only: [:index, :show]

    get "/pages/:id", PageController, :show
    get "/websites/:id", WebsiteController, :show

    post "/hit", HitController, :create
  end
end
