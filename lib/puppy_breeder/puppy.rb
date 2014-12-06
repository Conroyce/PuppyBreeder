#Refer to this class as PuppyBreeder::Puppy
module PuppyBreeder
  class Puppy
    attr_accessor :type, :number
    @@puppies = PuppyBreeder::PuppyRepo.new

    def initialize(type, number)
      @type = type
      @number = number
    end  

    def self.add_new(type,num)
      puppy = Puppy.new(type,num)
      @@puppies.add_pup(puppy)
    end  

    def self.add_puppy(type,num)
      @@puppies[type] += type.num
    end  

    def self.puppy_total(type) 
      @@puppies[type]
    end  
  end
end