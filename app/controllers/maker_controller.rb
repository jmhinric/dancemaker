class MakerController < ApplicationController
  def index
    @funny = Maker.new(funny_dance_attrs).phrases
    @beautiful = Maker.new(beautiful_dance_attrs).phrases
  end

  def beautiful_dance_attrs
    {
      moves: [
        { name: "arch", weight: 20 },
        { name: "lunge", weight: 20 },
        { name: "developpe", weight: 40 },
        { name: "pirouette", weight: 20 }
      ],

      qualities: [
        "gently",
        "slowly",
        "softly"
      ],

      duration: 6
    }
  end

  def funny_dance_attrs
    {
      moves: [
        { name: "smile",            weight: 15 },
        { name: "jump",             weight: 15 },
        { name: "shake",            weight: 15 },
        { name: "kick",             weight: 15 },
        { name: "stick out tongue", weight: 5 },
        { name: "turn head",        weight: 5 },
        { name: "give attitude",    weight: 12 },
        { name: "gesture",          weight: 18 }
      ],

      qualities: [
        "lovingly",
        "nervously",
        "slowly",
        "frantically",
        "numbly"
      ],

      duration: 2
    }
  end
end
