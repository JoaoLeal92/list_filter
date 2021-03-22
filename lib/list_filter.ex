defmodule ListFilter do
  require Integer

  def call(list) do
    list
    |> filterNumber()
    |> countOdd()
  end

  defp filterNumber(list) do
    Enum.filter(list, fn item ->
      parsedItem = Integer.parse(item)

      case parsedItem do
        {int, _} -> is_integer(int)
        :error -> false
      end
    end)
  end

  defp countOdd(list) do
    list
    |> Enum.filter(fn item ->
      {int, _} = Integer.parse(item)

      Integer.is_odd(int)
    end)
    |> length()
  end
end
