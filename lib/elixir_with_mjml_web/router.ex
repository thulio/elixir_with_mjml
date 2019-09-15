defmodule ElixirWithMjmlWeb.Router do
  use ElixirWithMjmlWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ElixirWithMjmlWeb do
    pipe_through :api

    post "/mjml", MjmlController, :compile
  end
end
