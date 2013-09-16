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
    dweet = Amnesia.transaction do
      last_dweet = Dweet.last
      id = if last_dweet do
             last_dweet.id + 1
           else
             1
           end
      d = Dweet[id: id, content: conn.params[:content]]
      d.write
      d
    end
    conn = conn.assign(:dweet, dweet)
    render conn, "post_complete.html"
  end

  get "/" do
    recent_dweets = Amnesia.transaction do
      if Dweet.last do
        Dweet.to_sequence.reverse |> Enum.take(10)
      else
        nil
      end
    end
    conn = conn.assign(:recent_dweets, recent_dweets)
    render conn, "index.html"
  end
end
