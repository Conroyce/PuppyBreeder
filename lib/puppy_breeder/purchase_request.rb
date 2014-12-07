#Refer to this class as PuppyBreeder::PurchaseRequest
module PuppyBreeder
  class PurchaseRequest
    attr_reader :requests, :pending
    attr_accessor :type, :customer, :status
    
    @@requests = PuppyBreeder::PurchasesRepo.new
    @@sales = 0
    # @@complete = PuppyBreeder::CompsRepo.new
    
    def initialize(customer, type)
      @customer = customer
      @type = type
      @status = nil
    end
    #pending: name,puppy,price?
    def self.add_request(customer,type) 
      new_req = PurchaseRequest.new(customer,type)
      @@requests.add_request(new_req)
    end 

    def self.clear_requests
      @@requests = PuppyBreeder::PurchasesRepo.new
      @@pending = PuppyBreeder::PendsRepo.new
    end 

    def self.get_request(customer)
      @@requests.get_request(customer)
    end  

    def self.make_purchase(customer,num=1,puppy=nil)
      if (num == 1) 
        @@requests.make_request(customer)
      elsif (num <= puppy.number && puppy.number-num >= 0)
        @@requests.complete_request(customer)
        puppy.number -= num  
      end  
    end 

    def self.get_sales
      @@requests.eaches
      #   arr = []
      #   if (value.status == "Completed")
      #     arr.push(value)
      #   end
      #   arr  
      # end  
    end  
    # def self.view_pending
    # end

    # def self.view_completed
    # end    
  end
end