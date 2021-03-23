require 'rails_helper'

feature 'Add to cart' do
  before(:each) do
    10.times do
      create(:product, image_url: 'cat.jpg')
    end
  end

  scenario 'random item' do
    visit store_index_path
    page.all("//*[@value='Add to cart']").sample.click
    page.find("//*[@value='Checkout']").click
    expect(page.has_current_path?('/checkout')).to be_truthy
  end

  scenario 'checkout with empty cart' do
    visit store_index_path
    page.all("//*[@value='Add to cart']").sample.click
    page.find("//*[@value='Checkout']").click
    expect(page.has_current_path?('/checkout')).to be_truthy
  end
end
