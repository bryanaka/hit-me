defmodule HitMeWeb.MilestonesController do
  use HitMeWeb, :controller

  alias HitMe.Repo, as: Repo
  alias HitMe.Milestone, as: Milestone

  def index(conn, _params) do
    render conn, "index.json-api", data: Repo.all(Milestone)
  end
end
