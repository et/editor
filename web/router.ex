defmodule Editor.Router do
  use Editor.Web, :router

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

  scope "/", Editor do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/documents", DocumentController, :index
    get "/documents/show", DocumentController, :show
    get "/documents/init", DocumentController, :init
  end

  # Other scopes may use custom stacks.
  # scope "/api", Editor do
  #   pipe_through :api
  # end
end
