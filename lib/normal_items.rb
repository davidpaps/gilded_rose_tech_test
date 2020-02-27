
class NormalItems

  ZERO = 0
  NORMAL = 1
  DOUBLE = 2

  def normal_items(item)
    minus_day(item)
    if (item.sell_in >= ZERO) && ((item.quality - NORMAL) >= ZERO)
      degrade_quality(item, NORMAL)
    elsif (item.quality - DOUBLE) >= ZERO
      degrade_quality(item, DOUBLE)
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