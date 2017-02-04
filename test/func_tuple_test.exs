defmodule FuncTupleTest do
  use ExUnit.Case

  import Func.Tuple

  test "fst" do
    assert fst({1, 2}) == 1
  end

  test "map_fst" do
    assert map_fst({1, 2}, &Integer.to_string/1) == {"1", 2}
  end

  test "snd" do
    assert snd({1, 2}) == 2
  end

  test "map_snd" do
    assert map_snd({1, 2}, &Integer.to_string/1) == {1, "2"}
  end

  test "swap" do
    assert swap({1, 2}) == {2, 1}
  end
end
