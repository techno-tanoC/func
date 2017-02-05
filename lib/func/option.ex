defmodule NilError do
  defexception message: "Invalid operation for nil"
end

defmodule Func.Option do
  def map(val, func) do
    if is_nil(val), do: func.(val)
  end

  def get(val, default) do
    unless is_nil(val) do
      val
    else
      default
    end
  end

  def get!(val) do
    unless is_nil(val) do
      val
    else
      raise NilError
    end
  end

  def maybe(val, func, default) do
    if is_nil(val) do
      func.(val)
    else
      default
    end
  end

  def fromList(list) do
    case list do
      [] -> nil
      [x|xs] -> x
    end
  end

  def toList(val) do
    if is_nil(val) do
      []
    else
      [val]
    end
  end
end
