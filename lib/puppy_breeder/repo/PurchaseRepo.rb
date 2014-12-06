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
end  