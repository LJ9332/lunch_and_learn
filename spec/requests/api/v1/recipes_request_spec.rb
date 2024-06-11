require 'rails_helper'

RSpec.describe "recipes API" do
  before(:each) do
  end

  describe "Recipes Index" do
    it "returns all recipes and their attributes for a specific country" do
      get "/api/v1/recipes?country=thailand"

      recipes = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(response).to be_successful
      expect(response.status).to eq(200)

      expect(recipes).to be_an(Array)
      

      recipes.each do |recipe|
        expect(recipe).to have_key(:id)
        expect(recipe[:id]).to be_a(String)

        expect(recipe[:attributes]).to have_key(:title)
        expect(recipe[:attributes][:title]).to be_a(String)

        expect(recipe[:attributes]).to have_key(:url)
        expect(recipe[:attributes][:url]).to be_an(String)

        expect(recipe[:attributes]).to have_key(:country)
        expect(recipe[:attributes][:country]).to be_an(String)

        expect(recipe[:relationships]).to have_key(:image)
        expect(recipe[:relationships][:image]).to be_an(String)
      end
    end
  end
end