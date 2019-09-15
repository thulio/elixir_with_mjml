defmodule ElixirWithMjmlWeb.MjmlView do
  use ElixirWithMjmlWeb, :view

  def render("index.json", %{message: message}) do
    %{html: message}
  end
end

