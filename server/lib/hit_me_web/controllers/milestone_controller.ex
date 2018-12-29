defmodule HitMeWeb.MilestoneController do
  use HitMeWeb, :controller

  alias HitMe.{Repo, Milestone}

  def index(conn, _params) do
    render conn, "index.json-api", data: Repo.all(Milestone)
  end

  def show(conn, params) do
    render conn, "show.json-api", data: Repo.get(Milestone, params[:id])
  end
end
