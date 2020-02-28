# frozen_string_literal: true

require_relative 'normal_items'
require_relative 'conjured_items'
require_relative 'backstage_passes'
require_relative 'aged_brie'
require_relative 'sulfuras'

class GildedRose
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def update_quality
    items.each do |item|
      case item.name
      when 'Sulfuras, Hand of Ragnaros'
        Sulfuras.update(item)
      when 'Aged Brie'
        AgedBrie.update(item)
      when 'Backstage passes to a TAFKAL80ETC concert'
        BackstagePasses.update(item)
      when 'Conjured Mana Cake'
        ConjuredItems.update(item)
      else '+5 Dexterity Vest' || 'Elixir of the Mongoose'
        NormalItems.update(item)
      end
    end
  end
end
