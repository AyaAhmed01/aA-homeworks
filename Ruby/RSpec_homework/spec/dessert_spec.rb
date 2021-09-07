require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  
  let(:chef) { double("chef", titleize: "Chef chef the Great Baker", bake: 400) }
  subject(:dessert){Dessert.new('cake', 55, chef)}
  
  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq('cake')
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(55)
    end

    it "starts ingredients as an empty array" do 
      expect(dessert.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect{Dessert.new('cake', '55', chef)}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do 
      dessert.add_ingredient('powder') 
      expect(dessert.ingredients).to include('powder')
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = %w(powder cream chocolate)
      ingredients.each {|ingr| dessert.add_ingredient(ingr)}
      dessert.mix!
      expect(dessert.ingredients).to_not eq(ingredients) 
      expect(dessert.ingredients).to match_array(ingredients)
      #Other solution:
      # expect(dessert.ingredients.sort).to eq(ingredients.sort)
      # expect(dessert.ingredients).not_to eq(ingredients)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect(dessert.eat(5)).to eq(50)
    end

    it "raises an error if the amount is greater than the quantity" do 
      expect{dessert.eat(80).to raise_error("not enough left!")}
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do 
      expect(dessert.serve).to include("chef the Great Baker has made 55 cakes")
      end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do 
      expect(chef).to receive(:bake).with(dessert) 
      dessert.make_more
    end
  end
end
