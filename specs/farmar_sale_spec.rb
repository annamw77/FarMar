require_relative './spec_helper'

describe FarMar::Sale do
	before do
		@test_sale = FarMar::Sale.find(1)
	end

	describe "self.all" do
		it "returns an array" do
			FarMar::Sale.all.must_be_instance_of Array
		end

		it "returns an array of FarMar::Sales instances" do
			FarMar::Sale.all[1].must_be_instance_of FarMar::Sale
		end
	end

	describe "self.find" do
		it "returns an instance of FarMar::Sale when given a valid id" do
			@test_sale.must_be_instance_of FarMar::Sale
		end

		it "returns [] when given an invalid id" do
			FarMar::Sale.find(9999999).must_equal nil
		end

		it "returns the correct instance when given a valid id" do
			@test_sale.amount.must_equal 9290
		end
	end

	describe "self.bewteen(beginning_time, end_time)" do
		before do
			@beginning_time = DateTime.parse("2013-11-12 06:00:00 -0800")
			@end_time = DateTime.parse("2013-11-12 06:05:00 -0800")
		end

		it "returns FarMar::Sale instances" do
			FarMar::Sale.between(@beginning_time, @end_time)[0].must_be_instance_of FarMar::Sale
		end

		it "returns the correct DateTime instances" do
			FarMar::Sale.between(@beginning_time, @end_time).length.must_equal 4
		end
	end

	describe "vendor method" do
		it "will return the correct vendor for a sale" do
			@test_sale.vendor.name.must_equal "Feil-Farrell"
		end
	end

	describe "product method" do
		it "will return the correct product for a sale" do
			@test_sale.product.name.must_equal "Dry Beets"
		end
	end

end
