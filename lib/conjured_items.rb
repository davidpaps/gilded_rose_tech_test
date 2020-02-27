# frozen_string_literal: true

class ConjuredItems
  ZERO = 0
  NORMAL = 1
  DOUBLE = 2
  QUADRUPLE = 4

  def update(item)
    minus_day(item)
    if (item.sell_in >= ZERO) && ((item.quality - DOUBLE) >= ZERO)
      degrade_quality(item, DOUBLE)
    elsif (item.quality - QUADRUPLE) >= ZERO
      degrade_quality(item, QUADRUPLE)
    end
  end

  private

  def minus_day(item)
    item.sell_in -= NORMAL
  end

  def degrade_quality(item, amount)
    item.quality -= amount
  end
end
