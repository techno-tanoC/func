defmodule Func.Presence do
  @moduledoc ~S"""
  """

  @doc ~S"""

      iex> Func.Presence.present?(nil)
      false
      iex> Func.Presence.present?(false)
      false
      iex> Func.Presence.present?("")
      false
      iex> Func.Presence.present?(%{})
      false
      iex> Func.Presence.present?([])
      false
      iex> Func.Presence.present?(1)
      true

  """
  @spec present?(any) :: boolean
  def present?(val) do
    case val do
      nil   -> false
      false -> false
      ""    -> false
      %{}   -> not Enum.empty?(val)
      []    -> false
      _     -> true
    end
  end

  @doc ~S"""

      iex> Func.Presence.blank?(nil)
      true
      iex> Func.Presence.blank?(false)
      true
      iex> Func.Presence.blank?("")
      true
      iex> Func.Presence.blank?(%{})
      true
      iex> Func.Presence.blank?([])
      true
      iex> Func.Presence.blank?(1)
      false

  """
  @spec present?(any) :: boolean
  def blank?(val), do: !present?(val)

  @doc ~S"""

      iex> Func.Presence.presence(nil)
      nil
      iex> Func.Presence.presence(false)
      nil
      iex> Func.Presence.presence("")
      nil
      iex> Func.Presence.presence(%{})
      nil
      iex> Func.Presence.presence([])
      nil
      iex> Func.Presence.presence(1)
      1

  """
  def presence(val) do
    if present?(val), do: val
  end

  @doc ~S"""

      iex> Func.Presence.empty?([])
      true
      iex> Func.Presence.empty?(%{})
      true
      iex> Func.Presence.empty?("")
      true
      iex> Func.Presence.empty?(1)
      false

  """
  def empty?(val) do
    case val do
      []  -> true
      %{} -> Enum.empty?(val)
      ""  -> true
      _   -> false
    end
  end

  @doc ~S"""

      iex> Func.Presence.non_empty?([])
      false
      iex> Func.Presence.non_empty?(%{})
      false
      iex> Func.Presence.non_empty?("")
      false
      iex> Func.Presence.non_empty?(1)
      true

  """
  def non_empty?(val), do: !empty?(val)
end
