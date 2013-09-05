defmodule Dwitter.Dynamo do
  use Dynamo

  config :dynamo,
    # The environment this Dynamo runs on
    env: Mix.env,

    # The OTP application associated with this Dynamo
    otp_app: :dwitter,

    # The endpoint to dispatch requests to
    endpoint: ApplicationRouter,

    # The route from which static assets are served
    # You can turn off static assets by setting it to false
    static_route: "/static"

  # Uncomment the lines below to enable the cookie session store
  # config :dynamo,
  #   session_store: Session.CookieStore,
  #   session_options:
  #     [ key: "_dwitter_session",
  #       secret: "UOsJjZfpSvXLxpgfD3D24kfDuu2jC8QCT6FD5+abbGW/FizDlsXCgnblU8SClvvm"]

  # Default functionality available in templates
  templates do
    use Dynamo.Helpers
  end
end
