require './lib/use_cases/helper.rb'

class ProjectsController < ApplicationController
	def new
		@project = User.find(current_user.id).projects.new
	end

	def show
		@project = User.find(current_user.id).projects.find(params[:id])
	end

	def create
		@project = User.find(current_user.id).projects.new
		@project.name = strong_params[:name]
		@project.description = strong_params[:description]
		@project.save

		filename = params[:project][:file].original_filename
		filebody = params[:project][:file].read
		File.write("temp_uploads/"+filename, filebody)
		import("temp_uploads/"+filename, @project.id)
		redirect_to user_projects_path
	end

	def index
		@projects = User.find(current_user.id).projects

	end


	def import(file, project_id)
		a = Bot_Report::Reader.new
		a.readfile(file, project_id)
	end

	private
	def strong_params
		params.required(:project).permit(:name, :description)
	end
end
