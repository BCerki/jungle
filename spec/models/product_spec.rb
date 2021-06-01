require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "needs price to be valid" do
      @category = Category.new(:name => "Bikes")
      @product = Product.new(:name => "Bug", :price => 5, :quantity => 1, :category => @category.id)
      expect(@product.price).to be_present
    end

    it "needs quantity to be valid" do
      @category = Category.new(:name => "Bikes")
      @product = Product.new(:name => "Bug", :price => 5, :quantity => 1, :category => @category.id)
      expect(@product.quantity).to be_present
    end

    it "needs category to be valid" do
      @category = Category.new(:name => "Bikes")
      @product = Product.new(:name => "Bug", :price => 5, :quantity => 1, :category => @category.id)
      expect(@product.category).to be_present
    end

    it "error raising" do
      @category = Category.new(:name => "Bikes")
      @product = Product.new(:name => "Bug", :price => 5, :quantity => 1, :category => @category.id)
      expect(@product.name).to be_nil
      expect(@product).to raise_error
    end


  end
end
