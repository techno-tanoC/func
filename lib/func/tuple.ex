defmodule Func.Tuple do
  def fst({x, _}), do: x

  def map_fst({x, y}, func) do
    {func.(x), y}
  end

  def snd({_, x}), do: x

  def map_snd({x, y}, func) do
    {x, func.(y)}
  end

  def swap({a, b}), do: {b, a}
end
