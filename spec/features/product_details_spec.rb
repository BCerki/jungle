require 'rails_helper'

RSpec.feature "Visitor navigates from  home page to product page", type: :feature, js: true do

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

  scenario "They navigate between pages" do
    # ACT
    visit root_path
    # first('.product-header').click_link

    # click_link match: :first
    click_link("Details »", match: :first)

    # VERIFY
    expect(page).to have_css '.dl-horizontal'

    # DEBUG
    save_screenshot 'individual-product.png'
    puts page.html

  end

end
