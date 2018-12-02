defmodule Day2 do
	
	def main do
		read_file()
		|> calc
	end

	def calc(stringList) when is_list(stringList) do
		{0,0}
		|> calc(stringList)
	end

	def calc({two, three}, []) do
		two * three
	end

	def calc({two, three}, [head|tail]) do
		{two, three}
		|> add(chunk(head))
		|> calc(tail)
	end

	def chunk(stringList) when is_list(stringList) do
		[]
		|> chunk(stringList)
	end

	def chunk(list, []) do
		list
	end

	def chunk(list, [head|tail]) do
		list ++ [chunk(head)]
		|> chunk(tail)		
	end

	def chunk(string) when is_binary(string) do
		String.codepoints(string)
		|> Enum.sort
		|> Enum.chunk_by(&(&1))
		|> len
	end

	def add({two,three},{false,false}) do
		{two,three}
	end

	def add({two,three},{true,false}) do
		{two+1,three}
	end

	def add({two,three},{false,true}) do
		{two,three+1}
	end

	def add({two,three},{true,true}) do
		{two+1,three+1}
	end

	def len(list) do
		{false,false}
		|> len(list)
	end

	def len({two, three}, [head|tail]) do
		{two, three}
		|> lenAdd(length(head))
		|> len(tail)
	end

	def len({two,three}, []) do
		{two,three}
	end

	def lenAdd({_, three}, 2) do
		{true, three}
	end

	def lenAdd({two, _}, 3) do
		{two, true}
	end

	def lenAdd({two, three}, _) do
		{two, three}
	end

	defp read_file() do
    	"lib/day2/input.txt"
    	|> File.read!()
    	|> String.split("\n")
  	end
end