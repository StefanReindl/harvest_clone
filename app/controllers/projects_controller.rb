class ProjectsController < ApplicationController
 

 	before_action :load_client
	before_action :load_project, only: [:show, :edit, :update, :destroy]

	def index
		@projects = Project.all
	end

	def show
		# @project = Project.find(project_params)
	end

	def new
		@project = @client.projects.build
	end

	def create
		@project = @client.projects.build(project_params)
		if @project.save
			redirect_to @client
		else 
			render :new
		end
	end

	def destroy
    @project.destroy
    redirect_to client_path(@client)
  end

  protected

  def project_params
  	params.require(:project).permit(:name)
  end

  def load_project
  	@project = @client.projects.find([:id])
  end

  def load_client
    @client = Client.find(params[:client_id])
  end


end
