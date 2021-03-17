require 'rails_helper'

RSpec.describe StoreController, type: :controller do
  describe "GET /" do
    it "get Store#index response 200 OK" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "GET /show" do
    it "get Store#show response 200 OK" do
      @product = create(:product)
      params = { id: @product.id }
      get :show, params: params
      expect(response.status).to eq(200)
    end
  end

  describe "GET /show" do
    it "get Store#show response 404 OK" do
      params = { id: 5 }
      expect { get :show, params: params }.to raise_error
    end
  end
end
