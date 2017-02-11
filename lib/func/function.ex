defmodule Func.Function do
  @moduledoc ~S"""
  Functions for function.

  ## Example

      import Func.Function
      {:ok, pid} = Agent.start_link(always(1))
      state = Agent.get(pid, id())

  """

  @doc ~S"""
  Identity function. It always returns its argument.

      iex> Func.Function.id().(1)
      1

  """
  @spec id() :: fun
  def id(), do: fn val -> val end

  @doc ~S"""
  Constant function. It always returns first argument.

      iex> Func.Function.const(1).(2)
      1

  """
  @spec const(any) :: fun
  def const(val), do: fn _ -> val end

  @doc ~S"""
  The function which always returns the arg.

      iex> Func.Function.always(1).()
      1

  """
  @spec always(any) :: fun
  def always(val), do: fn -> val end

  @doc ~S"""
  Composition function. Compose functions.

      iex> Func.Function.compose(&String.to_integer/1, &Integer.to_string/1).(1)
      1

  """
  @spec compose(fun, fun) :: fun
  def compose(f, g), do: fn x -> f.(g.(x)) end

  @doc ~S"""

      iex> Func.Function.curry(&(&1 + &2)).(1).(2)
      3
      iex> Func.Function.curry(&(&1 + &2 + &3)).(1).(2).(3)
      6

  """
  @spec curry(fun) :: fun
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
  @spec uncurry(fun) :: fun
  def uncurry(fun), do: &(fun.(&1).(&2))

  @doc ~S"""
  Applys arguments to curried function.

      iex> curried = fn x -> (fn y -> (fn z -> x + y + z end) end) end
      ...> Func.Function.uncurry(curried, [1, 2, 3])
      6

  """
  @spec uncurry(fun, [any]) :: any
  def uncurry(fun, args) when is_list(args) do
    Enum.reduce(args, fun, &(&2).(&1))
  end

  @doc ~S"""
  Flip function.

      iex> Func.Function.flip(&-/2).(1, 2)
      1

  """
  @spec flip(fun) :: fun
  def flip(func), do: fn a, b -> func.(b, a) end

  @doc ~S"""
  Flip and curry function.

      iex> Func.Function.curry_flip(&-/2).(1).(2)
      1

  """
  @spec curry_flip(fun) :: fun
  def curry_flip(func) do
    compose(&curry/1, &flip/1).(func)
  end

  defmacro __using__(_) do
    quote do
      import __MODULE__
    end
  end
end
