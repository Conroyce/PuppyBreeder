#create instance of breeder class that carries info and purchase requests
class PuppyBreeder::Breeder
  attr_accessor :status, :pending, :completed
  def initialize
    @status = nil
    @pending = []
    @completed = []
  end
  #puppy inventory, customer name, puppy sales, puppy type,
  #hash.each do |key,value|
  def self.make_request(var, cust) 
    var.each do |k,v|
      if (k == cust) 
        @pending.push(cust)
      end
    end    
  end  
end  