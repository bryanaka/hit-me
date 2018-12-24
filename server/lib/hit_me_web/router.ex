defmodule HitMeWeb.Router do
  use HitMeWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", HitMeWeb do
    pipe_through :api
  end
end
