class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!

  def load_country_state_city
    @countries = Country.order("name asc")
    @states = State.order("name asc")
    @cities = City.order("name asc")
  end
end
