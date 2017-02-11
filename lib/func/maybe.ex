defmodule Func.Maybe do
  @moduledoc ~S"""
  Functions that inspired by Haskell, Data.Maybe.
  [Data\.Maybe](https://hackage.haskell.org/package/base-4.9.1.0/docs/Data-Maybe.html)
  """

  @type nilable :: nil | any
  @type func :: (nilable -> any)

  @doc ~S"""
  If it isn't nil, maps the value.

      iex> Func.Maybe.map(1, &Integer.to_string/1)
      "1"
      iex> Func.Maybe.map(nil, & &1)
      nil

  """
  @spec map(nilable, func) :: any
  def map(nil, _), do: nil
  def map(val, fun), do: fun.(val)

  @doc ~S"""
  Gets the value. If it is nil, returns the default value.

      iex> Func.Maybe.get_or(1, "default")
      1
      iex> Func.Maybe.get_or(nil, "default")
      "default"

  """
  @spec get_or(nilable, any) :: any
  def get_or(nil, default), do: default
  def get_or(val, _), do: val

  @doc ~S"""
  If the value is nil, the function returns the default value. Otherwise, it applys the function to the value.

      iex> Func.Maybe.maybe(nil, & &1, "default")
      "default"
      iex> Func.Maybe.maybe(1, &Integer.to_string/1, "default")
      "1"

  """
  @spec maybe(nilable, func, any) :: any
  def maybe(nil, _, default), do: default
  def maybe(val, fun, _), do: fun.(val)

  @doc ~S"""
  If the list is empty, it returns nil. Otherwise, it returns the first element of the list.
  In other words, safe head function.

      iex> Func.Maybe.fromList([])
      nil
      iex> Func.Maybe.fromList([1])
      1
      iex> Func.Maybe.fromList([1, 2])
      1

  """
  @spec fromList([] | [any]) :: nilable
  def fromList([]), do: nil
  def fromList([x|_]), do: x

  @doc ~S"""
  It returns the singleton list when not nil. If the value is nil, it returns an empty list.

      iex> Func.Maybe.toList(nil)
      []
      iex> Func.Maybe.toList(1)
      [1]

  """
  @spec toList(nilable) :: [] | [any]
  def toList(nil), do: []
  def toList(val), do: [val]

  defmacro __using__(_) do
    quote do
      import __MODULE__
    end
  end
end
