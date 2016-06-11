defmodule DogRace do
  def didnt_win(places, actually_won) do
    didnt_win(0, actually_won, places, [])
  end
  defp didnt_win(acc, _actually_won, places, result) when acc > places do
    Enum.reverse(result)
  end
  defp didnt_win(0, actually_won, places, result) do
    didnt_win(1, actually_won, places, result)
  end
  defp didnt_win(11, actually_won, places, result) do
    new_result = ["11th" | result]
    didnt_win(12, actually_won, places, new_result)
  end
  defp didnt_win(12, actually_won, places, result) do
    new_result = ["12th" | result]
    didnt_win(13, actually_won, places, new_result)
  end
  defp didnt_win(13, actually_won, places, result) do
    new_result = ["13th" | result]
    didnt_win(14, actually_won, places, new_result)
  end
  defp didnt_win(acc, actually_won, places, result) when acc == actually_won do
    didnt_win(acc + 1, actually_won, places, result)
  end
  defp didnt_win(acc, actually_won, places, result) do
    new_result = [eval_acc(acc) | result]
    didnt_win(acc + 1, actually_won, places, new_result)
  end
  defp eval_acc(acc) do
    str_acc = Integer.to_string(acc)
    cond do
      String.ends_with?(str_acc, "1") -> str_acc <> "st"
      String.ends_with?(str_acc, "2") -> str_acc <> "nd"
      String.ends_with?(str_acc, "3") -> str_acc <> "rd"
      true -> str_acc <> "th"
    end
  end
end
