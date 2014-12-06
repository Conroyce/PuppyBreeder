#Refer to this class as PuppyBreeder::PurchaseRequest
module PuppyBreeder
  class PurchaseRequest
    attr_accessor :type, :customer
    @@requests = {}

    def initialize(customer, type)
      @customer = customer
      @type = type
    end
      
    def self.add_request(customer,type) 
      @@requests[customer] = PurchaseRequest.new(customer,type)
    end 

    def self.clear_requests
      @@requests = {}
    end 

    def self.get_request(customer)
      @@requests[customer]
    end  

  end
end