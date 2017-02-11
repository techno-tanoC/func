defmodule Func do
  @moduledoc ~S"""
  """

  defmacro __using__(_opts) do
    quote do
      import Func.Function
      import Func.Tuple
      import Func.Maybe
      import Func.Num
      import Func.Presence
      import Func.Bool
    end
  end
end
