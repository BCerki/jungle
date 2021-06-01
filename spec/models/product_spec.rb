require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "needs price to be valid" do
      category = Category.create(:name => "Bikes")
      @product = category.products.create({
        name:  'One-speed',
        quantity: 10,
        price: 64.99
      })
      expect(@product.price).to be_present
    end

    it "needs quantity to be valid" do
      category = Category.create(:name => "Bikes")
      @product = category.products.create({
        name:  'One-speed',
        quantity: 10,
        price: 64.99
      })
      expect(@product.quantity).to be_present
    end

    it "needs category to be valid" do
      category = Category.create(:name => "Bikes")
      @product = category.products.create({
        name:  'One-speed',
        quantity: 10,
        price: 64.99
      })
      expect(@product.category).to be_present
    end

    it "gives an error message if name is nil" do
      category = Category.create(:name => "Bikes")
      @product = category.products.create({
        name:  nil,
        quantity: 10,
        price: 64.99
      })
      expect(@product.name).to be_nil
      expect(@product.errors.full_messages).to eq(["Name can't be blank"])
    end


  end
end
