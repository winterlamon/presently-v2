class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
<<<<<<< HEAD
  helper_method :current_user, :require_user
=======
>>>>>>> 7db2af8601631cd1ae79e14a8cd464b08400a483

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

<<<<<<< HEAD
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!session[:user_id]
  end

  def require_user
    redirect_to '/login' unless current_user
  end

=======
>>>>>>> 7db2af8601631cd1ae79e14a8cd464b08400a483
end
