# Func

Functions inspired by haskell and ruby(activesupport).

The documentation is [here](https://hexdocs.pm/func/api-reference.html)

## Installation

```elixir
def deps do
  [{:func, "~> 0.3.0"}]
end
```

## Usage

`use Func` or import the respective module.

```elixir
use Func

# or

import Func.{Function, Maybe}
```

### Func.Function

#### Examples

```elixir
{:ok, pid} = Agent.start_link(always(1))
Agent.get(pid, id()) #=> 1
```
