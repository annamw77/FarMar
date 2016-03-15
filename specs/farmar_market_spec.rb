require_relative './spec_helper'

describe FarMar::Market do

	it "FarMar::Market Class Exists" do
		FarMar::Market.wont_be_nil
	end

	it "Instances of FarMar::Market Exist" do
		test_hash = {}
		sample = FarMar::Market.new(test_hash)
		sample.wont_be_nil
	end

	describe "self.all" do
		it "exists" do
			FarMar::Market.all.wont_be_nil
		end

		it "returns an array" do
			FarMar::Market.all.must_be_instance_of Array
		end

		it "returns an array of FarMar::Markets instances" do
			FarMar::Market.all[1].must_be_instance_of FarMar::Market
		end
	end

	describe "self.find" do
		it "exists" do
			FarMar::Market.find(1).wont_be_nil
		end

		it "returns an instance of FarMar::Market when given a valid id" do
			FarMar::Market.find(1).must_be_instance_of FarMar::Market
		end

		it "returns nil when given an invalid id" do
			FarMar::Market.find(9999999).must_be_nil
		end

		it "returns the correct instance when given a valid id" do
			FarMar::Market.find(1).city.must_equal "Portland"
		end
	end

	describe "self.vendors" do
		it "exists" do
			FarMar::Market.vendors(1).wont_be_nil
		end

		it "returns an array" do
			FarMar::Market.vendors(1).must_be_instance_of Array
		end

		it "returns an array containing FarMar::Vendor instance(s)" do
			FarMar::Market.vendors(1)[0].must_be_instance_of FarMar::Vendor
		end

		it "returns the correct instances of FarMar::Vendor" do
			test = FarMar::Market.vendors(30)
			test[0].name.must_equal "Gleichner and Sons"
		end

		# it "returns all correct instances of FarMar::Vendor"
		# tests a vendor id that has multiple matches somehow.
		
	end

end
