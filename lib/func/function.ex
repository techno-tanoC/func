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
  def id() do
    fn val -> val end
  end

  @doc """
  Constant function. It always returns first argument.

      iex> Func.Function.const(1).(2)
      1
  """
  def const(val) do
    fn _ -> val end
  end

  @doc """
  The function which the value is got by execution.

      iex> Func.Function.run(1).()
      1
  """
  def run(val) do
    fn -> val end
  end

  @doc """
  Curry function.

      iex> Func.Function.curry(&+/2).(1).(2)
      3
  """
  def curry(func) do
    fn a ->
      fn b ->
        func.(a, b)
      end
    end
  end

  @doc """
  Flip function.

      iex> Func.Function.flip(&-/2).(1, 2)
      1
  """
  def flip(func) do
    fn a, b -> func.(b, a) end
  end

  @doc """
  Flip and curry function.

      iex> Func.Function.curry_flip(&-/2).(1).(2)
      1
  """
  def curry_flip(func) do
    curry(flip(func))
  end

  @doc """
  Composition function. Compose functions.

      iex> Func.Function.compose(&String.to_integer/1, &Integer.to_string/1).(1)
      1
  """
  def compose(f, g) do
    fn x -> f.(g.(x)) end
  end
end
