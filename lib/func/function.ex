defmodule Func.Function do
  defmacro id() do
    quote do
      fn val -> val end
    end
  end

  defmacro const(exp) do
    quote do
      fn _ -> unquote(exp) end
    end
  end

  defmacro run(exp) do
    quote do
      fn -> unquote(exp) end
    end
  end
end
