require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations.' do
    context "Product is created." do
      it "Product Saves" do
        @category = Category.new({name:"peaches"})
        @category.save!
        puts @category.id

        @product = Product.new({
          name: "yellow peach",
          category_id: @category.id,
          quantity: 3,
          price: 20 
        })

        puts @product.inspect

        expect(@product.save).to be_truthy
        puts @product.inspect
      end

      it "Product has a name" do
        @category = Category.new({name:"peaches"})
        @category.save!
        @product = Product.new({
          name: "yellow peach",
          category_id: @category.id,
          quantity: 3,
          price: 20 
        })
        expect(@product.name).to be_present
      end

      it "Product has a price" do
        @category = Category.new({name:"peaches"})
        @category.save!
        @product = Product.new({
          name: "yellow peach",
          category_id: @category.id,
          quantity: 3,
          price: 20 
        })
        expect(@product.price).to be_present
      end

      it "Product has a quantity" do
        @category = Category.new({name:"peaches"})
        @category.save!
        @product = Product.new({
          name: "yellow peach",
          category_id: @category.id,
          quantity: 3, 
          price: 20
        })

        expect(@product).to be_valid
      end

      it "Product has a category" do
        @category = Category.new({name:"peaches"})
        @category.save!
        @product = Product.new({
          name: "yellow peach",
          category_id: @category.id,
          quantity: 3,
          price: 20 
        })
        expect(@product.category).to be_present
      end

      it "Throws price error when no price is given" do
        @category = Category.new({name:"peaches"})
        @category.save!
        @product = Product.new({
          name: "yellow peach",
          category_id: @category.id,
          quantity: 3,
          price: ""
        })
        puts @product.save
        expect(@product.errors.full_messages).to include("Price is not a number")

      end

    end

  end
end
