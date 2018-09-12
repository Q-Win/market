class Market

  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    @vendors.find_all {|vendor| vendor.check_stock(item) > 0 }
  end

  def sorted_item_list
    unique_items.sort
  end

  def unique_items
    item_array = []
    vendor_inventory.map do |inv|
      item_array += inv.keys
    end
    item_array.uniq
  end

  def vendor_inventory
    @vendors.map do |vendor|
      vendor.inventory
    end
  end

  def total_inventory
    inventory_hash = Hash.new(0)
    unique_items.each do |item|
      @vendors.each do |vendor|
        inventory_hash[item] += vendor.check_stock(item)
      end
    end
    inventory_hash
  end

end
