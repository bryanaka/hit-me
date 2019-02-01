defmodule HitMeWeb.WebsiteView do
  use HitMeWeb, :view
  use JaSerializer.PhoenixView

  attributes [:host, :name]

  has_many :pages, serializer: PageView
end

curl http://localhost:4000/api/milestones -H "Content-Type: application/vnd.api+json" -H "Accept: application/vnd.api+json"