class Api::V1::TouristSitesController < ApplicationController 
  def show
    @searched_site = params[:q]

    conn = Faraday.new( url 'https://api.geoapify.com')
    response = conn.get('/v1/geocode/search?api_key=2b4b5c09990a4c198fb1552d0b9ad591&country=france')
    data = JSON.parse(response.body, symbolize_names: true)

    site_list = data[:tourist_sites].first(10)

    @sites = site_list
  end
end
