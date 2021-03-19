require 'rails_helper'

RSpec.describe "orders/index", type: :view do
  before(:each) do
    assign(:orders, [
      Order.create!(
        name: "Name",
        address: "MyText",
        phone: "Phone",
        email: "Email",
        payment_method: 2
      ),
      Order.create!(
        name: "Name",
        address: "MyText",
        phone: "Phone",
        email: "Email",
        payment_method: 2
      )
    ])
  end

  it "renders a list of orders" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "Phone".to_s, count: 2
    assert_select "tr>td", text: "Email".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
