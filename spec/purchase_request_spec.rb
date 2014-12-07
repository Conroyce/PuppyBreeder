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
        expect(new_request.customer).to eq(old_request.customer)
        expect(new_request.type).to eq("Pomeranian")
      end
    end    
  end  
  
  describe "#make_purchase" do 
    it "will add pending status upon making purchase" do
      request = PuppyBreeder::PurchaseRequest.add_request("Greg","Lab")
      pend_request = PuppyBreeder::PurchaseRequest.make_purchase("Greg")
      expect(request.status).to eq("Pending")
    end

    it "will add complete status upon completing purchase" do
      puppy = PuppyBreeder::Puppy.add_new("Great Dane",5)
      request = PuppyBreeder::PurchaseRequest.add_request("Bob","Great Dane")
      comp_request = PuppyBreeder::PurchaseRequest.make_purchase("Bob",4,puppy)
      expect(request.status).to eq("Complete")
      expect(puppy.number).to eq(1)  
    end  
  end 

  describe "#get_sales" do
    it "will return [] if no sales have been made" do
      request1 = PuppyBreeder::PurchaseRequest.add_request("Adam","Chihuahua")
      request2 = PuppyBreeder::PurchaseRequest.add_request("Becca","Rottweiler")
      sales = PuppyBreeder::PurchaseRequest.get_sales
      expect(sales).to eq([])
    end  

    it "will return completed sales if sales are made" do
      request1 = PuppyBreeder::PurchaseRequest.add_request("Suzy","German Shepherd")
      request2 = PuppyBreeder::PurchaseRequest.add_request("Matt","Australian Shepherd")
      puppy1 = PuppyBreeder::Puppy.add_new("German Shepherd",4)
      puppy2 = PuppyBreeder::Puppy.add_new("Australian Shedpherd",3)
      make_request1 = PuppyBreeder::PurchaseRequest.make_purchase("Suzy",2,puppy1)
      make_request2 = PuppyBreeder::PurchaseRequest.make_purchase("Matt",3,puppy2)
      sales1 = PuppyBreeder::PurchaseRequest.get_sales
      expect(sales1[0]).to eq(request1) 
      expect(sales1[1]).to eq(request2)
    end  
  end 
   
end
























