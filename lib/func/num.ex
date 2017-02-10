defmodule Func.Num do
  @moduledoc ~S"""
  """

  @type num :: number

  @doc ~S"""

      iex> Func.Num.zero?(0)
      true
      iex> Func.Num.zero?(1)
      false

  """
  @spec zero?(num) :: boolean
  def zero?(num), do: num == 0

  @doc ~S"""

      iex> Func.Num.non_zero?(0)
      false
      iex> Func.Num.non_zero?(1)
      true

  """
  @spec non_zero?(num) :: boolean
  def non_zero?(num), do: !zero?(num)

  @doc ~S"""

      iex> Func.Num.positive?(1)
      true
      iex> Func.Num.positive?(0)
      false
      iex> Func.Num.positive?(-1)
      false

  """
  @spec positive?(num) :: boolean
  def positive?(num), do: num > 0

  @doc ~S"""

      iex> Func.Num.negative?(1)
      false
      iex> Func.Num.negative?(0)
      false
      iex> Func.Num.negative?(-1)
      true

  """
  @spec negative?(num) :: boolean
  def negative?(num), do: num < 0

  @doc ~S"""
  Successor function.

      iex> Func.Num.succ(41)
      42

  """
  @spec succ(num) :: num
  def succ(int), do: int + 1

  @doc ~S"""
  Predecessor function.

      iex> Func.Num.pred(43)
      42

  """
  @spec pred(num) :: num
  def pred(int), do: int - 1
end
