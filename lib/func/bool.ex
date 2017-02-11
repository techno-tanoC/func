defmodule Func.Bool do
  @moduledoc ~S"""
  """

  @doc ~S"""
  Case analysis for the Bool type.
  Inspired by Haskell. See [Data\.Bool](https://hackage.haskell.org/package/base-4.9.1.0/docs/Data-Bool.html#v:bool).

      iex> Func.Bool.bool(1, 2, false)
      1
      iex> Func.Bool.bool(1, 2, true)
      2

  """
  @spec bool(any, any, boolean) :: any
  def bool(x, y, b) do
    if b, do: y, else: x
  end

  defmacro __using__(_) do
    quote do
      import __MODULE__
    end
  end
end
