defmodule Day1 do

  def main do
    read_file()
    |> Enum.map(fn(row) -> to_ins(row) end)
    |> execute
  end

  defp execute(instructions) do
    0
    |> execute(instructions)
  end

  defp execute(pos, []) do
    pos
  end

  defp execute(pos, [ins | tail]) do
    pos
    |> calculate(ins)
    |> execute(tail)
  end

  def calculate(pos, {"+", value}) do
    pos + value
  end

  def calculate(pos, {"-", value}) do
    pos - value
  end

  defp read_file() do
    "lib/day1/input.txt"
    |> File.read!()
    |> String.split("\n")
  end

  defp to_ins(row) do
    row
    |> String.split_at(1)
    |> conv_ins
  end

  defp conv_ins({a, b}) do
    {a, String.to_integer(b)}
  end

end
