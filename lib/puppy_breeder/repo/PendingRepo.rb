class PuppyBreeder::PendsRepo
  def initialize
    @pends_hash = {}
  end

  def add_pend(cust)
   @pends_hash[cust.customer] = cust
   @pends_hash[cust.status] = "Pending"
  end  
end    