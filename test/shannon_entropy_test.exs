defmodule ShannonEntropyTest do
  use ExUnit.Case

  alias ShannonEntropy

  test "calculates Shannon entropy correctly" do
    data = ["A", "R", "A", "R", "A"]
    expected_counts = [%{"A" => 2}, %{"R" => 2}]
    expected_entropy = 0.9709505944546686

    {category_counts, entropy} = ShannonEntropy.run(data)

    assert category_counts == expected_counts
    assert Float.round(entropy, 10) == Float.round(expected_entropy, 10)
  end
end
