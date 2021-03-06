defmodule TunesrankWeb.Router do
  use TunesrankWeb, :router

  require Ueberauth

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TunesrankWeb do
    pipe_through :browser
    get "/", PageController, :index
    get "/logout", AuthController, :logout
  end

  scope "/auth", TunesrankWeb do
    pipe_through :browser
    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback
    post "/:provider/callback", AuthController, :callback
  end

  scope "/profiles", TunesrankWeb do
    pipe_through :browser
    resources "/profiles", ProfilesController
  end

  # Other scopes may use custom stacks.
  # scope "/api", TunesrankWeb do
  #   pipe_through :api
  # end
end
