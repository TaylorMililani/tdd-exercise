# blackjack_score.rb
VALID_CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']

def blackjack_score(hand)

  hand.each do |card|
    if !VALID_CARDS.include?(card)
      raise ArgumentError.new("#{card} is not a valid card")
    end
  end

  hand.sort_by! { |card| card == 'Ace' ? 1 : 0 }

  score = 0
  i = 0
  hand.each do |card|
    if card == 'Jack' || card == 'Queen' || card == 'King'
      score += 10
    elsif card == 'Ace'
      if score > 10
        score += 1
      else
        score += 11
      end
    else
      score += card
    end

  end

  if score > 21
    raise ArgumentError.new("Score cannot be more than 21")
  end

  return score
end

