defmodule Func.Tuple do
  @doc ~S"""
  Takes the first element of Pair.

      iex> Func.Tuple.fst({1, 2})
      1

  """
  def fst(pair)
  def fst({x, _}), do: x

  @doc ~S"""
  Maps the first element, then returns pair.

      iex> Func.Tuple.map_fst({1, 2}, &Integer.to_string/1)
      {"1", 2}

  """
  def map_fst(pair, func)
  def map_fst({x, y}, func) do
    {func.(x), y}
  end

  @doc ~S"""
  Takes the second element of pair.

      iex> Func.Tuple.snd({1, 2})
      2

  """
  def snd(pair)
  def snd({_, x}), do: x

  @doc ~S"""
  Maps the second element, then returns pair.

      iex> Func.Tuple.map_snd({1, 2}, &Integer.to_string/1)
      {1, "2"}

  """
  def map_snd(pair, func)
  def map_snd({x, y}, func) do
    {x, func.(y)}
  end

  @doc ~S"""
  Swaps elements of pair.

      iex> Func.Tuple.swap({1, 2})
      {2, 1}

  """
  def swap(pair)
  def swap({a, b}), do: {b, a}
end
