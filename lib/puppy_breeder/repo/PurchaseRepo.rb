class PuppyBreeder::PurchasesRepo
  def initialize 
    @purchase_hash = {}
  end  

  def add_request(request)
    @purchase_hash[request.customer] = request
  end

  def get_request(customer)
    @purchase_hash[customer]
  end
  
  def make_request(customer)
    @purchase_hash[customer].status = "Pending"
  end 

  def complete_request(customer)
    @purchase_hash[customer].status = "Complete"
  end  
end  