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
        request = PuppyBreeder::PurchaseRequest.get_requests("Jim")
        expect(request).to eq(nil)
      end
    end 

    context "customer is added" do
      it "will return customer info" do
        old_request = PuppyBreeder::PurchaseRequest.add_request("Sandra","Pomeranian")
        new_request = PuppyBreeder::PurchaseRequest.get_requests("Sandra")
        expect(new_request.customer).to eq(old_request.customer)
        expect(new_request.type).to eq("Pomeranian")
      end
    end    
  end  
  
  describe "#make_purchase" do 
    it "will add pending status upon making purchase" do
      request = PuppyBreeder::PurchaseRequest.add_request("Greg","Lab")
      puppy = PuppyBreeder::Puppy.add_new("Lab",1)
      pend_request = PuppyBreeder::PurchaseRequest.make_purchase("Greg",3,puppy)
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

    it "will return both completed and pending sales" do
      request1 = PuppyBreeder::PurchaseRequest.add_request("Suzy","German Shepherd")
      request2 = PuppyBreeder::PurchaseRequest.add_request("Matt","Australian Shepherd")
      pend_request = PuppyBreeder::PurchaseRequest.add_request("Steve","Saint Bernard")

      puppy1 = PuppyBreeder::Puppy.add_new("German Shepherd",4)
      puppy2 = PuppyBreeder::Puppy.add_new("Australian Shedpherd",3)
      pend_puppy = PuppyBreeder::Puppy.add_new("Saint Bernard",1)

      make_request1 = PuppyBreeder::PurchaseRequest.make_purchase("Suzy",2,puppy1)
      make_request2 = PuppyBreeder::PurchaseRequest.make_purchase("Matt",3,puppy2)
      make_pend_request = PuppyBreeder::PurchaseRequest.make_purchase("Steve",3,pend_puppy)

      sales = PuppyBreeder::PurchaseRequest.get_sales

      expect(sales[0]).to eq(request1) 
      expect(sales[1]).to eq(request2)
      expect(sales[2]).to eq(pend_request)
    end 
  end 
  
  describe "purchase request on hold" do 
    it "will not be visible when checking requests" do 
      request = PuppyBreeder::PurchaseRequest.add_request("Jim","Great Dane")
      hold_me = PuppyBreeder::PurchaseRequest.on_hold("Jim")
      the_request = PuppyBreeder::PurchaseRequest.get_requests("Jim")

      expect(the_request).to eq(nil)
      expect(request.status).to eq("Hold")
    end  
  end 
end
























