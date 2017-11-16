class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :require_user

  def get_all_etsy_listings #parses all the data from JSON into array of hashes
    url = 'https://openapi.etsy.com/v2/listings/active?api_key=z6u2v4p18o5m8va3gpv5132a'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    @etsy = JSON.parse(response)
    n = 1
    @listings_array = []
    100.times do
      all_listings_hash = @etsy
      @listings_array << all_listings_hash["results"]
      n += 1
    end
    @listings_array = @listings_array.flatten
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!session[:user_id]
  end

  def require_user
    redirect_to '/login' unless current_user
  end

end
