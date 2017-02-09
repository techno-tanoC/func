defmodule Func.Maybe do
  @moduledoc ~S"""
  """

  @type nilable :: nil | any
  @type func :: (nilable -> any)

  @doc ~S"""

      iex> Func.Maybe.map(1, &Integer.to_string/1)
      "1"
      iex> Func.Maybe.map(nil, & &1)
      nil

  """
  @spec map(nilable, func) :: any
  def map(nil, _), do: nil
  def map(val, fun), do: fun.(val)

  @doc ~S"""

      iex> Func.Maybe.get_or(1, "default")
      1
      iex> Func.Maybe.get_or(nil, "default")
      "default"

  """
  @spec get_or(nilable, any) :: any
  def get_or(nil, default), do: default
  def get_or(val, _), do: val

  @doc ~S"""

      iex> Func.Maybe.maybe(nil, & &1, "default")
      "default"
      iex> Func.Maybe.maybe(1, &Integer.to_string/1, "default")
      "1"

  """
  @spec maybe(nilable, func, any) :: any
  def maybe(nil, _, default), do: default
  def maybe(val, fun, _), do: fun.(val)

  @doc ~S"""

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

      iex> Func.Maybe.toList(nil)
      []
      iex> Func.Maybe.toList(1)
      [1]

  """
  @spec toList(nilable) :: [] | [any]
  def toList(nil), do: []
  def toList(val), do: [val]
end
