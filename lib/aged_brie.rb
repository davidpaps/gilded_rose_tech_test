# frozen_string_literal: true

class AgedBrie
  ZERO = 0
  NORMAL = 1
  DOUBLE = 2
  MAX = 50

  def self.update(item)
    minus_day(item)
    if (item.quality < MAX) && (item.sell_in >= ZERO)
      improve_quality(item, NORMAL)
    elsif ((item.quality + DOUBLE) <= MAX) && (item.sell_in < ZERO)
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
