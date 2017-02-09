defmodule DocTest do
  use ExUnit.Case

  doctest Func.Function
  doctest Func.Tuple
  doctest Func.Maybe
  doctest Func.Num
  doctest Func.Presence
end
