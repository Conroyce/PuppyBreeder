class PuppyBreeder::PurchasesRepo
  def initialize 
    @purchase_hash = {}
  end  

  def add_request(request)
    @purchase_hash[request.customer] = request
  end

  def get_request(customer)
    if (@purchase_hash.has_key?(customer) && @purchase_hash[customer].status == nil) #could be problematic when switching to databases
      @purchase_hash[customer] 
    else 
      nil
    end  
  end
  
  def make_request(customer)
    @purchase_hash[customer].status = "Pending"
  end 

  def complete_request(customer)
    @purchase_hash[customer].status = "Complete"
  end  

  def make_hold(customer)
    @purchase_hash[customer].status = "Hold"
  end  

  def eaches
    arr = []
    @purchase_hash.each do |key,value|
      if (value.status == "Complete" || value.status == "Pending")
        arr.push(value)
      end
    end
    arr    
  end  
end  