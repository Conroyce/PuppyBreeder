require_relative 'spec_helper.rb'

describe PuppyBreeder::PurchaseRequest do
  before(:each) do
    PuppyBreeder::PurchaseRequest.clear_requests
  end  
  
  describe "#add_request" do
    it "check a hash that will hold the customer's name and breed desired" do
      request = PuppyBreeder::PurchaseRequest.add_request("Steve","Border Collie")
      expect(request.customer).to eq("Steve")
      expect(request.type).to eq("Border Collie")
    end
  end

  describe "#get_request" do
    context "no customer is created" do
      it "will return nil" do
        request = PuppyBreeder::PurchaseRequest.get_request("Jim")
        expect(request).to eq(nil)
      end
    end 

    context "customer is added" do
      it "will return customer info" do
        old_request = PuppyBreeder::PurchaseRequest.add_request("Sandra","Pomeranian")
        new_request = PuppyBreeder::PurchaseRequest.get_request("Sandra")
        # expect(old_request.customer).to eq("Sandra")
        expect(new_request.customer).to eq(old_request.customer)
        expect(new_request.type).to eq("Pomeranian")
      end
    end    
  end  
  
  

   
end
