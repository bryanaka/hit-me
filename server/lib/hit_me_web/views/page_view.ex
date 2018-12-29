defmodule HitMeWeb.PageView do
  use HitMeWeb, :view
  use JaSerializer.PhoenixView

  attributes [:hit_count, :path]

  has_one :website, serializer: WebsiteView

end
