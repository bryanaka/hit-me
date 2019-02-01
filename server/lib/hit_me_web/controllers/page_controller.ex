defmodule HitMeWeb.PageController do
  use HitMeWeb, :controller

  alias HitMe.{Repo, Page}

  def show(conn, params) do
    render conn, "show.json-api", data: Repo.get(Page, params[:id])
  end

end
