defmodule ElixirWithMjml do
  @moduledoc """
  ElixirWithMjml keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  @success "<!-- FILE: undefined -->"
  def compile(mjmlTemplate, beautify) do
    output =
      'echo "#{mjmlTemplate}" |  mjml -i -s --config.beautify #{beautify}'
      |> :os.cmd()
      |> to_string

    if String.starts_with?(output, @success) do
      {:ok, sanitize(output)}
    else
      {:error, :invalid_template}
    end
  end

  defp sanitize(message) do
    message
    |> String.replace("<!-- FILE: undefined -->", "")
    |> String.replace("\n", "")
  end
end
