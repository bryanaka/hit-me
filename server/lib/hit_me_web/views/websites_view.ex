defmodule HitMeWeb.WebsitesView do
  use HitMeWeb, :view
  use JaSerializer.PhoenixView

  attributes [:host, :name]

  has_many :pages, serializer: PagesView
end
