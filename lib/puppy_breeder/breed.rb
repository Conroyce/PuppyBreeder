module PuppyBreeder
  class Breed
    attr_accessor :type, :price
    attr_reader :breeds
    @@breeds = PuppyBreeder::BreedsRepo.new

    def initialize(type, price = 1000)
      @type = type
      @price = price
    end  

    def self.set_breed_price(type, price)
      breed = Breed.new(type,price)
      @@breeds.add_breed(breed)
    end 

    def self.get_breed(type)
      @@breeds.get_breed(type)
    end
    
    def self.clear_breeds 
      @@breeds = PuppyBreeder::BreedsRepo.new
    end  
  end  
end  
