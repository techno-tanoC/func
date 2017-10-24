defmodule Func.Result do
  @moduledoc ~S"""
  Functions that inspired by Haskell, Data.Either.
  [Data\.Maybe](https://hackage.haskell.org/package/base-4.9.1.0/docs/Data-Either.html)
  """

  @doc ~S"""
  Maps the result if the value is ok. Otherwise, return itself.

      iex> Func.Result.map({:ok, 1}, &Integer.to_string/1)
      {:ok, "1"}
      iex> Func.Result.map({:error, 1}, &Integer.to_string/1)
      {:error, 1}
      iex> Func.Result.map(1, &Integer.to_string/1)
      1
  """
  @spec map({any, any}, fun) :: {any, any}
  def map({:ok, val}, f), do: {:ok, f.(val)}
  def map(val, _), do: val

  @doc ~S"""
  Maps and flatten if the value is ok. Otherwise, return itself.

      iex> Func.Result.flat_map({:ok, 1}, &{:ok, &1 + 1})
      {:ok, 2}
      iex> Func.Result.flat_map({:error, 1}, &{:error, &1 + 1})
      {:error, 1}
      iex> Func.Result.flat_map(1, &{:ok, &1 + 1})
      1
  """
  @spec flat_map({any, any}, fun) :: {any, any}
  def flat_map({:ok, val}, f), do: f.(val)
  def flat_map(val, _), do: val

  @doc ~S"""
  Maps the result if the value is error. Otherwise, return itself.

      iex> Func.Result.map_error({:ok, 1}, &Integer.to_string/1)
      {:ok, 1}
      iex> Func.Result.map_error({:error, 1}, &Integer.to_string/1)
      {:error, "1"}
      iex> Func.Result.map_error(1, &Integer.to_string/1)
      1
  """
  @spec map_error({any, any}, fun) :: {any, any}
  def map_error({:error, val}, f), do: {:error, f.(val)}
  def map_error(val, _), do: val

  @doc ~S"""
  Maps and flatten if the value is error. Otherwise, return itself.

      iex> Func.Result.flat_map_error({:ok, 1}, &{:ok, &1 + 1})
      {:ok, 1}
      iex> Func.Result.flat_map_error({:error, 1}, &{:error, &1 + 1})
      {:error, 2}
      iex> Func.Result.flat_map_error(1, &{:ok, &1 + 1})
      1
  """
  @spec flat_map_error({any, any}, fun) :: {any, any}
  def flat_map_error({:error, val}, f), do: f.(val)
  def flat_map_error(val, _), do: val

  @doc ~S"""
  Creates the ok value

      iex> Func.Result.ok(1)
      {:ok, 1}
  """
  @spec ok(any) :: {any, any}
  def ok(val), do: {:ok, val}

  @doc ~S"""
  Creates the error value.

      iex> Func.Result.error(1)
      {:error, 1}
  """
  @spec error(any) :: {any, any}
  def error(val), do: {:error, val}

  @doc ~S"""
  Checks wether the value is the ok.

      iex> Func.Result.ok?({:ok, 1})
      true
      iex> Func.Result.ok?({:error, 1})
      false
      iex> Func.Result.ok?(1)
      false
  """
  @spec ok?({any, any}) :: boolean
  def ok?({:ok, _}), do: true
  def ok?(_), do: false

  @doc ~S"""
  Checks wether the value is the error.

      iex> Func.Result.error?({:ok, 1})
      false
      iex> Func.Result.error?({:error, 1})
      true
      iex> Func.Result.ok?(1)
      false
  """
  @spec error?({any, any}) :: boolean
  def error?({:error, _}), do: true
  def error?(_), do: false

  @doc ~S"""
  If the value is ok, applys the first function. If the value is error, applys the second function. Otherwise returns itself

      iex> Func.Result.join({:ok, 1}, &Integer.to_string/1, &Atom.to_string/1)
      "1"
      iex> Func.Result.join({:error, :atom}, &Integer.to_string/1, &Atom.to_string/1)
      "atom"
      iex> Func.Result.join(1, &Integer.to_string/1, &Atom.to_string/1)
      1
  """
  @spec join({any, any}, fun, fun) :: any
  def join({:ok, val}, f, _), do: f.(val)
  def join({:error, val}, _, g), do: g.(val)
  def join(val, _, _), do: val

  @doc ~S"""
  Collects only ok values.

      iex> Func.Result.collect_oks([{:ok, 1}, {:ok, 2}, {:error, 3}, 4])
      [1, 2]
  """
  @spec collect_oks([{any, any}]) :: [any]
  def collect_oks(vals) do
    vals |> Enum.filter(&ok?/1) |> Enum.map(fn {:ok, val} -> val end)
  end

  defmacro __using__(_) do
    quote do
      import __MODULE__
    end
  end
end
