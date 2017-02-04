defmodule Func.Function do
  def id() do
    fn val -> val end
  end

  def const(val) do
    fn _ -> val end
  end

  def run(val) do
    fn -> val end
  end

  def curry(func) do
    fn a ->
      fn b ->
        func.(a, b)
      end
    end
  end

  def flip(func) do
    fn a, b -> func.(b, a) end
  end

  def curry_flip(func) do
    curry(flip(func))
  end

  def compose(f, g) do
    fn x -> f.(g.(x)) end
  end
end
