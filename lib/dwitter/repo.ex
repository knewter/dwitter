defmodule Dwitter.Repo do
  use Ecto.Repo, adapter: Ecto.Adapters.Postgres

  def url do
    "ecto://postgres:postgres@localhost/dwitter"
  end

  def priv do
    app_dir(:dwitter, "priv/repo")
  end
end
