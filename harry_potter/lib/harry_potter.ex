defmodule HarryPotter do
  @moduledoc """
  Once upon a time there was a series of 5 books about a very English hero called Harry. (At least when this Kata was invented,
  there were only 5. Since then they have multiplied) Children all over the world thought he was fantastic, and, of course,
  so did the publisher. So in a gesture of immense generosity to mankind, (and to increase sales) they set up the following
  pricing model to take advantage of Harry’s magical powers.

  One copy of any of the five books costs 8 EUR. If, however, you buy two different books from the series, you get a 5% discount
  on those two books. If you buy 3 different books, you get a 10% discount. With 4 different books, you get a 20% discount.
  If you go the whole hog, and buy all 5, you get a huge 25% discount.

  Note that if you buy, say, four books, of which 3 are different titles, you get a 10% discount on the 3 that form part of a set,
  but the fourth book still costs 8 EUR.

  Potter mania is sweeping the country and parents of teenagers everywhere are queueing up with shopping baskets overflowing with
  Potter books. Your mission is to write a piece of code to calculate the price of any conceivable shopping basket,
  giving as big a discount as possible.
  """

  def price([]), do: 0

  def price([ _book ]), do: 8

  def price(books) when is_list(books) do
    price(books, [], [])
  end

  defp price([] = _books, current_discount, discounts) do
    discounts = [current_discount, discounts]
  end

  defp price(books, current_discount, discounts) do
    case try_to_feed_discount(books, current_discount) do
      {false, _books, _current_discount} -> price(books, [], [current_discount | discounts])
      {true, new_books, new_current_discount} -> price(new_books, new_current_discount, discounts)
    end
  end

  defp try_to_feed_discount(books, discount) do
    if Enum.all?(books, fn book -> Enum.member?(discount, book) end) do
      { false, books, discount }
    else
      {books_not_eligible, books_eligbible} = Enum.split_with(books, fn book -> Enum.member?(discount, book) end)
      { true, books_not_eligible, [books_eligbible | discount]}
    end

  end





  def compute_reduc(unique_books) do
    
  end
end
