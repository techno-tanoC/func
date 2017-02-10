defmodule Func.Function do
  @moduledoc """
  Functions for function.

  ## Example

      import Func.Function
      {:ok, pid} = Agent.start_link(run(1))
      state = Agent.get(pid, id())
      state == 1
  """

  @doc """
  Identity function. It always returns its argument.

      iex> Func.Function.id().(1)
      1

  """
  def id(), do: fn val -> val end

  @doc """
  Constant function. It always returns first argument.

      iex> Func.Function.const(1).(2)
      1

  """
  def const(val), do: fn _ -> val end

  @doc """
  The function which always returns the arg.

      iex> Func.Function.always(1).()
      1

  """
  def always(val), do: fn -> val end

  @doc """
  Composition function. Compose functions.

      iex> Func.Function.compose(&String.to_integer/1, &Integer.to_string/1).(1)
      1

  """
  def compose(f, g), do: fn x -> f.(g.(x)) end

  @doc ~S"""

      iex> Func.Function.curry(&(&1 + &2)).(1).(2)
      3
      iex> Func.Function.curry(&(&1 + &2 + &3)).(1).(2).(3)
      6

  """
  def curry(fun) do
    {_, arity} = :erlang.fun_info(fun, :arity)
    curry(fun, arity, [])
  end

  defp curry(fun, 0, args), do: apply(fun, Enum.reverse(args))
  defp curry(fun, arity, args) do
    fn arg -> curry(fun, arity - 1, [arg | args]) end
  end

  @doc ~S"""

      iex> Func.Function.uncurry(fn x -> fn y -> x + y end end).(1, 2)
      3

  """
  def uncurry(fun), do: &(fun.(&1).(&2))

  @doc ~S"""
  Applys arguments to curried function.

      iex> curried = fn x -> (fn y -> (fn z -> x + y + z end) end) end
      ...> Func.Function.uncurry(curried, [1, 2, 3])
      6

  """
  def uncurry(fun, args) when is_list(args) do
    Enum.reduce(args, fun, &(&2).(&1))
  end

  @doc """
  Flip function.

      iex> Func.Function.flip(&-/2).(1, 2)
      1

  """
  def flip(func), do: fn a, b -> func.(b, a) end

  @doc """
  Flip and curry function.

      iex> Func.Function.curry_flip(&-/2).(1).(2)
      1

  """
  def curry_flip(func) do
    compose(&curry/1, &flip/1).(func)
  end
end
