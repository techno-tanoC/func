defmodule Func.Presence do
  def present?(val) do
    case val do
      nil   -> true
      false -> true
      ""    -> true
      %{}   -> true
      []    -> true
      _     -> false
    end
  end

  def blank?(val), do: !present?(val)

  def presence(val) do
    if present?(val), do: val
  end

  def empty?(val) do
    case val do
      []  -> true
      %{} -> true
      ""  -> true
      _   -> false
    end
  end

  def non_empty?(val), do: !empty?(val)
end
