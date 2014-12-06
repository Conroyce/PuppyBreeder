class PuppyBreeder::PuppyRepo
  def initialize
    @pup_hash = {}
  end
  
  def add_pup(pup)
    @pup_hash[pup.type] = pup
  end
  
  def get_pup(pup)
    @pup_hash[pup]
  end  
end  