defmodule Func do
  defmacro __using__(_opts) do
    quote do
      import Func.Function
    end
  end
end
