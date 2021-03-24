require 'rails_helper'

RSpec.feature "Success checkout", type: :feature do
  pending
  scenario "with correct order values" do
    # add some item to cart
    # visit to checkout page
    # fill form with correct values
    # click confirm
    # check is the page has path for thank_you page
  end
end

RSpec.feature "Failed checkout", type: :feature do
  pending
  scenario "with empty name" do
    # add some item to cart
    # visit to checkout page
    # fill form with correct values exclude name field
    # click confirm
    # check is the page has path for thank_you page
  end

  scenario "with empty address" do
    # add some item to cart
    # visit to checkout page
    # fill form with values exclude address field
    # click confirm
    # check is the page has invalid address alert
  end

  scenario "with wrong email" do
    # add some item to cart
    # visit to checkout page
    # fill form with values
    # fill email field with incorrect email
    # click confirm
    # check is the page has invalid email alert
  end

  scenario "with empty email" do
    # add some item to cart
    # visit to checkout page
    # fill form with values exclude email field
    # click confirm
    # check is the page has invalid email alert
  end

end
