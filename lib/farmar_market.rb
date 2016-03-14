require_relative '../far_mar.rb'

class FarMar::Market
  attr_reader :id, :name, :address, :city, :county, :state, :zip

  def initialize(market_hash)
    @id = market_hash[:id]
    @name = market_hash[:name]
    @address = market_hash[:address]
    @city = market_hash[:city]
    @county = market_hash[:county]
    @state = market_hash[:state]
    @zip = market_hash[:zip]
  end

  def self.all
    all_markets = CSVHasher.hashify('../support/markets.csv')
      all_markets.each do |n|
        FarMar::Market.new(n)
      end
  end

  def self.find(id)
    id=id.to_s
    all_markets = CSVHasher.hashify('../support/markets.csv')

    all_markets.each do |n|
      if n[:id] == id
        return FarMar::Market.new(n)
      end
    end
  end
end

# n = {:id=>"500", :name=>"Montefiore Medical Center Farmers Market_Thursday", :address=>"111 E. 210th Street", :city=>"Bronx", :county=>"Bronx", :state=>"New York", :zip=>"10467"}