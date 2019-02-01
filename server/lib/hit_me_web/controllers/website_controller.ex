defmodule HitMeWeb.WebsiteControler do
  use HitMeWeb, :controller

  alias HitMe.{Repo, Website}

  def show(conn, params) do
    render conn, "show.json-api", data: Repo.get(Website, params[:id])
  end
end
