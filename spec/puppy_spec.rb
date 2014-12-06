require_relative 'spec_helper.rb'

describe "PuppyBreeder::BreedsRepo" do
  before(:each) do 
    PuppyBreeder::Breed.clear_breeds
  end
  
  describe "#set_breed_price" do
    it "allows me to set the price of the breed" do
      breed = PuppyBreeder::Breed.set_breed_price("Terrier",1000)
      expect(breed).to be_a(PuppyBreeder::Breed)
      expect(breed.type).to eq("Terrier")
      expect(breed.price).to eq(1000)  
    end
  end

  describe "#get_breed" do
    context "no breed has been set" do
      it "will return nil" do
       breed = PuppyBreeder::Breed.get_breed("Terrier")
       expect(breed).to eq(nil)
      end
    end   
  
    context "breed has been set" do
      it "will return price" do
        old_breed = PuppyBreeder::Breed.set_breed_price("Terrier",1000)
        new_breed = PuppyBreeder::Breed.get_breed("Terrier")  
        expect(new_breed.type).to eq("Terrier")
        expect(old_breed.price).to eq(new_breed.price)
      end  
    end  
  end 
  # As a breeder, I want to be able to add new puppies to my inventory.
  describe "#add_puppy" do
    context "new puppies added" do
      it "allows me to add puppies!" do
        puppy = PuppyBreeder::Puppy.add_new("poodle",3)
        expect(puppy).to be_a(PuppyBreeder::Puppy)
        expect(puppy.type).to eq("poodle")
        expect(puppy.number).to eq(3)
      end 
    end
    
    context "puppies key exists" do
      it "adds puppies onto existing key" do

      end
    end    
  end 

  describe "#puppy_total" do
    context "no amount set" do
      it "returns nil" do
        puppy = PuppyBreeder::Puppy.puppy_total("shiitzu")
        expect(puppy).to eq(nil)
      end
    end 

    context "amount set" do 
      it "return amount" do
        new_puppy = PuppyBreeder::Puppy.add_puppy("Husky",4)
        old_puppy = PuppyBreeder::Puppy.puppy_total("Husky")
        expect(new_puppy.number).to eq(4)
        expect(old_puppy.number).to eq(4)
      end  
    end    
  end 

  # describe "#add_puppy" do
  #   it "adds puppies to existing puppy hash" do
  #     puppy = PuppyBreeder::Puppy.add_new("Malamute",2)
  #     puppy.add_puppy("Malamute",3)
  #     expect(puppy.number).to eq(5)   #issues with add_puppy method
  #   end  
  # end  
end




















