require 'rails_helper'

RSpec.describe 'Static content', type: :feature do
  before(:each) do
    4.times do
      create(:product, image_url: 'cat.jpg' )
    end
  end

  it 'shows the static text' do
    visit store_index_path
    byebug
    @add_to_cart = page.find_field with: "Add to cart", type: :submit
    byebug
    expect(page).to have_content 'Total sum: 8.99'
  end
end

=begin
RSpec.describe "store/index.html.slim", type: :view do
  before(:each) do
    @products = []
      4.times do
        @products << build(:product, image_url: 'cat.jpg')
      end
  end

  it "display store index page" do
    assign :index, Product.all

    render
    rendered
    expect(rendered).to have_text('Our photos')
  end
=end
