defmodule Func do
  @moduledoc ~S"""
  """

  defmacro __using__(opts) do
    quote do
      alias Func.{unquote_splicing(opts[:alias] || [])}
      import Func.{unquote_splicing(opts[:import] || [])}
    end
  end
end
