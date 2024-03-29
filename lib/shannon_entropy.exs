defmodule ShannonEntropy do
  @moduledoc """
  Documentation for `ShannonEntropy`.
  """

  @doc """
  Entropy fellas!!
  This is a simple CLI to calculate Shannon entropy.

  ## Examples
    Starts the CLI and asks the user to enter a list of data to calculate the entropy.
      iex> ShannonEntropy.run(["A", "R", "A", "R", "A"])

      Occurrence counts of each category:
      ["A": 1
      "R": 2
      "A": 1
      "A"]: 1
      Entropy: 1.9219280948873623 bits

  """
  def run do
    IO.puts("Welcome to the entropy calculator, fellas!")
    IO.puts("Please insert a comma-separated list of data:")

    input = IO.gets("") |> String.trim() |> String.split(",")
    data = Enum.map(input, &String.trim/1)

    {category_counts, entropy} = calculate_entropy(data)

    IO.puts("\nOccurrence counts of each category:")
    Enum.each(category_counts, fn {category, count} ->
      IO.puts("#{category}: #{count}")
    end)

    IO.puts("Entropy: #{entropy} bits")
  end

  defp calculate_entropy(data) when is_list(data) do
    total_count = length(data)
    categories = Enum.uniq(data)

    category_counts = Enum.map(categories, fn category ->
      count = Enum.count(data, &(&1 == category))
      {category, count}
    end)

    entropy = Enum.reduce(category_counts, 0, fn {_, count}, acc ->
      probability = count / total_count
      acc - (probability * :math.log2(probability))
    end)

    {category_counts, entropy}
  end
end

ShannonEntropy.run()
