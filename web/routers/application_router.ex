defmodule ApplicationRouter do
  use Dynamo.Router
  use Dwitter.Database

  prepare do
    # Pick which parts of the request you want to fetch
    # You can comment the line below if you don't need
    # any of them or move them to a forwarded router
    conn = conn.fetch([:cookies, :params])
    conn = conn.assign(:title, "Welcome to Dwitter!")
  end

  # It is common to break your Dynamo into many
  # routers, forwarding the requests between them:
  # forward "/posts", to: PostsRouter

  post "/post" do
    # Store a new dweet based on conn.params[:content] and assign to dweet
    conn = conn.assign(:dweet, dweet)
    render conn, "post_complete.html"
  end

  get "/" do
    # Assign recent_dweets to the last 10 dweets
    conn = conn.assign(:recent_dweets, recent_dweets)
    render conn, "index.html"
  end
end
