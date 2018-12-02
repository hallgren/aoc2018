defmodule Day2Test do
  use ExUnit.Case

  test "calc" do
  	assert Day22.calc(["aabbb","abccc"]) == {1,2}
  end

  test "chunk string list" do
  	assert Day22.chunk(["aabb","abbccc"]) == [{true,false},{true,true}]
  end

  test "chunk string" do
  	assert Day22.chunk("baabb") == {true, true}
  end

  test "add nothing" do
  	assert Day22.add({0,0},{false,false}) == {0,0}
  end  

  test "add two" do
  	assert Day22.add({0,0},{true,false}) == {1,0}
  end  

  test "add three" do
  	assert Day22.add({0,0},{false,true}) == {0,1}
  end 

  test "add two and three" do
  	assert Day22.add({0,0},{true,true}) == {1,1}
  end

  test "len empty list" do
  	assert Day22.len({false,false}, []) == {false,false}
  end

  test "len one two" do
  	assert Day22.len({false,false}, [["a","a"]]) == {true,false}
  end

  test "len one three" do
  	assert Day22.len({false,false}, [["a","a","a"]]) == {false,true}
  end

  test "len one two and three" do
  	assert Day22.len({false,false}, [["b","b"],["a","a","a"]]) == {true,true}
  end

  test "len 2 two" do
  	assert Day22.len({false,false}, [["a","a"],["b","b"]]) == {true,false}
  end

  test "len 2 two 2 three" do
  	assert Day22.len({false,false}, [["a","a"],["b","b"], ["c","c","c"], ["d","d","d","d"]]) == {true,true}
  end

  test "lenAdd one" do
    assert Day22.lenAdd({false,false}, 1) == {false,false}
  end

  test "lenAdd two" do
    assert Day22.lenAdd({false,false}, 2) == {true,false}
  end

  test "lenAdd three" do
    assert Day22.lenAdd({false, false}, 3) == {false,true}
  end
end