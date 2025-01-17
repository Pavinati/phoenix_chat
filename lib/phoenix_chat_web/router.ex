defmodule PhoenixChatWeb.Router do
  use PhoenixChatWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhoenixChatWeb do
    pipe_through :browser

    live("/", PhoenixChatLive)
  end

  # Other scopes may use custom stacks.
  # scope "/api", PhoenixChatWeb do
  #   pipe_through :api
  # end
end
