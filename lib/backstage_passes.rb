# frozen_string_literal: true

class BackstagePasses
  ZERO = 0
  NORMAL = 1
  DOUBLE = 2
  TRIPLE = 3
  MAX = 50

  def self.update(item)
    minus_day(item)
    if item.sell_in < ZERO
      item.quality = ZERO
    elsif ((item.quality + NORMAL) <= MAX) && (item.sell_in > 10)
      improve_quality(item, NORMAL)
    elsif ((item.quality + TRIPLE) <= MAX) && (item.sell_in < 6)
      improve_quality(item, TRIPLE)
    elsif ((item.quality + DOUBLE) <= MAX) && (item.sell_in < 11)
      improve_quality(item, DOUBLE)
    end
  end

  private_class_method

  def self.minus_day(item)
    item.sell_in -= NORMAL
  end

  def self.improve_quality(item, amount)
    item.quality += amount
  end
end
