defmodule FuncFunctionTest do
  use ExUnit.Case

  import Func.Function

  test "id" do
    assert id().(1) == 1
  end

  test "const" do
    assert const(1).(2) == 1
  end

  test "run" do
    assert run(1).() == 1
  end

  test "curry" do
    assert curry(&+/2).(1).(2) == 3
  end

  test "flip" do
    assert flip(&-/2).(1, 2) == 1
  end

  test "curry_flip" do
    assert curry_flip(&-/2).(1).(2) == 1
  end

  test "compose" do
    assert compose(&String.to_integer/1, &Integer.to_string/1).(1) == 1
  end
end
