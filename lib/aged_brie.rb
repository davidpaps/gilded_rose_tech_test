class AgedBrie

  ZERO = 0
  NORMAL = 1
  DOUBLE = 2
  MAX = 50

  def update(item)
    minus_day(item)
    if (item.quality < MAX) && (item.sell_in >= ZERO)
      improve_quality(item, NORMAL)
    elsif ((item.quality + DOUBLE) <= MAX) && (item.sell_in < ZERO)
      improve_quality(item, DOUBLE)
    end
  end

  def minus_day(item)
    item.sell_in -= NORMAL
  end

  def improve_quality(item, amount)
    item.quality += amount
  end

end