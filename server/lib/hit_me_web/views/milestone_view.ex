defmodule HitMeWeb.MilestoneView do
  use HitMeWeb, :view
  use JaSerializer.PhoenixView

  attributes [:code, :name, :description, :hit_count]

end
