defmodule Fib do
  def run(n) do
    stream()
    |> Enum.at(n)
  end

  def stream() do
    {0, 1}
    |> Stream.unfold(fn {current, next} ->
      {current, {next, current + next}}
    end)
  end
end
