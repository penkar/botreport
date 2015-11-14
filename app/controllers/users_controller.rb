class UsersController < ApplicationController
  before_action :authenticate_user!, :except => [:index]

	def index
	end

	def show
		@reports = current_user.projects
	end
end
