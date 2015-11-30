class MakerController < ApplicationController
  def index
    @phrases = [beautiful_phrase, funny_phrase]
  end

  def beautiful_phrase
    Phrase.new(
      name: "Beautiful Phrase",
      movement_vocabulary: beautiful_movement_vocab,
      num_measures: 8,
      beats_per_measure: 3
    )
  end

  def funny_phrase
    Phrase.new(
      name: "Funny Phrase",
      movement_vocabulary: funny_movement_vocab,
      num_measures: 7,
      beats_per_measure: 5
    )
  end

  def beautiful_movement_vocab
    MovementVocabulary.new(
      name: "beautiful",
      movements: beautiful_movements,
      qualities: [
        "gently",
        "slowly",
        "softly"
      ]
    )
  end

  def funny_movement_vocab
    MovementVocabulary.new(
      name: "funny",
      movements: funny_movements,
      qualities: [
        "lovingly",
        "nervously",
        "slowly",
        "frantically",
        "numbly"
      ]
    )
  end

  def beautiful_movements
    make_movements(
      [
        { name: "arch",      weight: 20 },
        { name: "lunge",     weight: 20 },
        { name: "developpe", weight: 40 },
        { name: "pirouette", weight: 20 }
      ]
    )
  end

  def funny_movements
    make_movements(
      [
        { name: "smile",            weight: 15 },
        { name: "jump",             weight: 15 },
        { name: "shake",            weight: 15 },
        { name: "kick",             weight: 15 },
        { name: "stick out tongue", weight: 5  },
        { name: "turn head",        weight: 5  },
        { name: "give attitude",    weight: 12 },
        { name: "gesture",          weight: 18 }
      ]
    )
  end

  def make_movements(movements_attrs)
    movements_attrs.map { |attrs| Movement.new(attrs) }
  end
end
