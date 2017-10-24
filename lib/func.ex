defmodule Func do
  @moduledoc ~S"""
  """

  defmacro __using__(_opts) do
    quote do
      alias Func.Function
      alias Func.Tuple
      alias Func.Maybe
      alias Func.Num
      alias Func.Presence
      alias Func.Bool
    end
  end
end
