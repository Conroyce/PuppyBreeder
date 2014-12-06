class PuppyBreeder::PuppyRepo
  def initialize
    @pup_hash = {}
  end
  
  def add_pup(pup)
    @pup_hash[pup.type] = pup
  end
  

end  