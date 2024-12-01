defmodule Aoc2024 do
  alias Aoc2024.Day1
  
  @moduledoc """
  Root module for invoking all solutions
  """

  def show_solutions() do
    IO.puts("""
    Day 1 - Problem 1: #{Day1.solve_first()}
    Day 1 - Problem 2: #{Day1.solve_second()}
    """)
  end
end
