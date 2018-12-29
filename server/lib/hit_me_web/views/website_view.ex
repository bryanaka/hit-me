defmodule HitMeWeb.WebsiteView do
  use HitMeWeb, :view
  use JaSerializer.PhoenixView

  attributes [:host, :name]

  has_many :pages, serializer: PageView
end
