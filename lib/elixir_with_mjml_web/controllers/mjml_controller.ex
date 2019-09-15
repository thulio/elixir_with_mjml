defmodule ElixirWithMjmlWeb.MjmlController do
  use ElixirWithMjmlWeb, :controller

  def compile(conn, %{"mjml" => template, "minify" => minify}) do
    with {:ok, html} <- ElixirWithMjml.compile(template, minify) do
      render(conn, "index.json", message: html)
    else
      {:error, :invalid_template} ->
        conn |> put_status(422) |> json(%{"error" => "Invalid template"})
    end
  end

  def compile(conn, %{"mjml" => template}) do
    compile(conn, %{"mjml" => template, "minify" => false})
  end
end

