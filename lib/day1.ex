defmodule Aoc2024.Day1 do
  def filename() do
    "data/d1.txt"
  end

  def solve_first() do
    filename()
    |> File.stream!()
    |> extract_lists()
    |> sort_lists()
    |> list_differences()
    |> Enum.sum()
  end

  def solve_second() do
    {l1, l2} =
      filename()
      |> File.stream!()
      |> extract_lists()

    similarity_score(l1, Enum.frequencies(l2))
  end

  def extract_lists(input_stream) do
    input_stream
    |> Stream.map(fn line ->
      [s1, s2] = String.split(line, "   ")
      {string_segment_to_integer(s1), string_segment_to_integer(s2)}
    end)
    |> Enum.unzip()
  end

  def string_segment_to_integer(segment) do
    segment
    |> Integer.parse()
    |> elem(0)
  end

  def sort_lists({l1, l2}) do
    {Enum.sort(l1), Enum.sort(l2)}
  end

  def list_differences({l1, l2}) do
    Enum.zip_with(l1, l2, fn e1, e2 -> abs(e1 - e2) end)
  end

  def similarity_score(list, map) do
    list
    |> Enum.map(fn x -> x * Map.get(map, x, 0) end)
    |> Enum.sum()
  end
end
