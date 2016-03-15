#get rid of ln2 after done with IRB testing
require_relative '../far_mar.rb'

class FarMar::Sale
  attr_reader :id, :amount, :purchase_time, :vendor_id, :product_id

  def initialize(sales_hash)
    @id = sales_hash[:id]
    @amount = sales_hash[:amount]
    @purchase_time = sales_hash[:purchase_time]
    @vendor_id = sales_hash[:vendor_id]
    @product_id = sales_hash[:product_id]
  end

  def self.all
    all_sales = CSVHasher.hashify('../support/sales.csv')
      all_sales.collect do |n|
        FarMar::Sale.new(n)
      end
  end

  def self.find(id)
    id=id.to_s

    all_sales = FarMar::Sale.all

    all_sales.each do |n|
      if n.id == id
        return n
      end
    end
      return nil
  end

  def vendor
    all_vendors = FarMar::Vendor.all
    all_vendors.select { |v| v.id == @vendor_id}
  end

  def product
    all_products = FarMar::Product.all
    all_products.select { |p| p.id == @product_id}
  end

  #self.between(beginning_time, end_time): returns a collection
  #of FarMar::Sale objects where the purchase time is between the two times given as arguments
  
end
