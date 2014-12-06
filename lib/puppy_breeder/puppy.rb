#Refer to this class as PuppyBreeder::Puppy
module PuppyBreeder
  class Puppy
    attr_accessor :type, :number
    @@puppies = {}

    def initialize(type, number)
      @type = type
      @number = number
    end  

    def self.add_puppy(type,num)
      if (@@puppies.has_key?(type))
        @@puppies[type] = Puppy.new(type,num)
        else
        @@puppies[type] += num
      end     
    end  

    # def self.add_puppy(type,num)
    #   puts "Check puppy hash: #{@@puppies[type]}"
    #   @@puppies[type] += num
    # end  

    def self.puppy_total(type) 
      @@puppies[type]
    end  
  end
end