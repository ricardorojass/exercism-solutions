class BoutiqueInventory
  def initialize(items)
    @items = items
  end

  def item_names
    @items.map { |product| product[:name] }.sort
  end

  def cheap
    @items.select { |product| product[:price] < 30 }
  end

  def out_of_stock
    @items.select { |product| product[:quantity_by_size].empty? }
  end

  def stock_for_item(name)
    @items.detect { |p| p[:name] == name }.fetch(:quantity_by_size)
  end

  def total_stock
    @items.map {|p| p[:quantity_by_size].values.sum }.sum
  end

  private
  attr_reader :items
end
