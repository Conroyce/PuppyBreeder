#Refer to this class as PuppyBreeder::PurchaseRequest
module PuppyBreeder
  class PurchaseRequest
    attr_accessor :type, :customer
   
    @@requests = PuppyBreeder::PurchaseRequest.new

    def initialize(customer, type)
      @customer = customer
      @type = type
    end
      
    def self.add_request(customer,type) 
      new_req = PurchaseRequest.new(customer,type)
      @@requests.add_request(new_req)
    end 

    def self.clear_requests
      @@requests = PuppyBreeder::PurchaseRequest.new
    end 

    def self.get_request(customer)
      @@requests[customer]
    end  

  end
end