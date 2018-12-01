defmodule Day1_2 do

  def main do
    read_file()
    |> Enum.map(fn(row) -> to_ins(row) end)
    |> execute
  end

  defp execute(instructions) do
    {0, [], instructions}
    |> execute(instructions)
  end

  defp execute({pos, list, org_ins}, []) do
    execute({pos, list, org_ins}, org_ins)
  end

  defp execute({pos, positions, org_ins}, [ins | tail]) do
    
    new_pos = pos
    |> calculate(ins)

    cond do
      exist?(new_pos, positions) -> 
        new_pos
      true ->
        {new_pos, positions, org_ins}
        |> add()
        |> execute(tail)
    end
  end

  defp exist?(pos, list) do
    if Enum.member?(list, pos) do
      true
    else
      false
    end
  end

  defp add({pos, list, org_ins}) do
    {pos, list ++ [pos], org_ins}
  end

  defp calculate(pos, {"+", value}) do
    pos + value
  end

  defp calculate(pos, {"-", value}) do
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
