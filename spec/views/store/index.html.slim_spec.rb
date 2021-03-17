require 'rails_helper'

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
    binding.irb

    rendered
    expect(rendered).to have_text('Our photos')
  end
end