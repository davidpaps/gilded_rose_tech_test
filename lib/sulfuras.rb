# frozen_string_literal: true

class Sulfuras
  NORMAL = 1

  def update(item)
    minus_day(item)
  end

  private

  def minus_day(item)
    item.sell_in -= NORMAL
  end
end
