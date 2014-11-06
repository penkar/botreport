class HomeController < ApplicationController
  def login
  end

  def options
  	@user = current_user.id
  end

  def options_price
  	puts params

  end
end
