require 'rails_helper'

RSpec.feature "Success checkout", type: :feature do
  pending
  let(:product) { build(:product, title: "some animals") }
  scenario "with correct order values" do
    # create cart with item(s)
    # visit to checkout page
    # fill form with correct values
    # click confirm
    # check is the page has path for thank_you page
  end
end

RSpec.feature "Failed checkout", type: :feature do
  pending
  scenario "with empty filled form" do
    # add some item to cart
    # visit to checkout page
    # # click confirm without filling any fields
    # check is the page has alerts
  end
end
