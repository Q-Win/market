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
    item_array = []
    vendor_inventory.map do |inv|
      item_array += inv.keys
    end
    item_array.uniq.sort
  end

  def vendor_inventory
    @vendors.map do |vendor|
      vendor.inventory
    end
  end

end
