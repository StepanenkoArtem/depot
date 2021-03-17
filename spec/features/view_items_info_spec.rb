require 'rails_helper'

RSpec.feature "ViewItemsInfos", type: :feature do
  scenario "View to store item detail info" do
    visit '/'
    expect(page).to have_content('Our photos')
  end
end
