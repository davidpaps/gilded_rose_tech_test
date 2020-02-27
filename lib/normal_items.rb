# frozen_string_literal: true

class NormalItems
  ZERO = 0
  NORMAL = 1
  DOUBLE = 2

  def self.update(item)
    minus_day(item)
    if (item.sell_in >= ZERO) && ((item.quality - NORMAL) >= ZERO)
      degrade_quality(item, NORMAL)
    elsif (item.quality - DOUBLE) >= ZERO
      degrade_quality(item, DOUBLE)
    end
  end

  def self.minus_day(item)
    item.sell_in -= NORMAL
  end

  def self.degrade_quality(item, amount)
    item.quality -= amount
  end
end
