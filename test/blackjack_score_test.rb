require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'

require_relative '../lib/blackjack_score'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Blackjack Score' do
  it 'can calculate the score for a pair of number cards' do

    # Arrange
    hand = [3, 4]

    # Act
    score = blackjack_score(hand)

    # Assert <-  You do this part!
    expect(score).must_equal 7
  end

  it 'facecards have values calculated correctly' do

    hand = ['Ace', 'Jack', 7]

    score = blackjack_score(hand)

    expect(score).must_equal 18

  end

  it 'calculates aces as 11 where it does not go over 21' do

    hand = [4, 3, 3, 'Ace']

    score = blackjack_score(hand)

    expect(score).must_equal 21

  end

  it 'calculates aces as 1, if an 11 would cause the score to go over 21' do

    hand = ['King', 9 , 'Ace']

    score = blackjack_score(hand)

    expect(score).must_equal 20

  end

  it 'raises an ArgumentError for invalid cards' do

    hand = [9, 17, 'Jack']
    expect {
      blackjack_score(hand)
    }.must_raise ArgumentError

    hand = ['Nine', 7, 5]
    expect {
      blackjack_score(hand)
    }.must_raise ArgumentError
    hand = ['Jack', 5, -2]
    expect {
      blackjack_score(hand)
    }.must_raise ArgumentError

  end

  it 'raises an ArgumentError for scores over 21' do

    hand = ['Jack', 10, 2]
    expect {
      blackjack_score(hand)
    }.must_raise ArgumentError

    hand = ['Jack', 5, 9]
    expect {
      blackjack_score(hand)
    }.must_raise ArgumentError

    hand = ['Jack', 5, 7]
    expect {
      blackjack_score(hand)
    }.must_raise ArgumentError

  end
end
