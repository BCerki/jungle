require 'rails_helper'

RSpec.feature "Adding to cart", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They add a product to cart and cart count updates" do
    # ACT
    visit root_path
    click_button("Add", match: :first)

    # VERIFY
    expect(page).to have_text "My Cart (1)"

    # DEBUG
    save_screenshot 'one-product-in-cart.png'
  end

end
