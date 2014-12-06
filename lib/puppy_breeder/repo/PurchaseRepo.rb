class PuppyBreeder::PurchaseRequest
  def initialize 
    @purchase_hash = {}
  end  

  def add_request(request)
    @purchase_hash[request.customer] = request
  end  
end  