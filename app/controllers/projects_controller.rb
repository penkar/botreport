class ProjectsController < ApplicationController
	def new
		@project = Project.new
		@project.user_id = current_user.id
	end

	def show
	end

	def create

	end

	def index
		@projects = User.find(current_user.id).projects

	end


	def import
		a = Bot_Report::Reader.new
		a.readfile(params[:file])
	end
end
