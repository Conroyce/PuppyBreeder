class PuppyBreeder::BreedsRepo
  def initialize
     @breed_hash = {}
  end
  
  def add_breed(breed)  
    @breed_hash[breed.type] = breed
  end  

  def get_breed(type)
    @breed_hash[type]
  end  
end  

