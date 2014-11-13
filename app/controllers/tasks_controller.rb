class TasksController < ApplicationController

	before_filter :load_client
	before_filter :load_project
	before_filter :load_task, only: [:show, :edit, :update, :destroy]


	def index
		@tasks = Task.all
	end

	def show
		# @task = Task.find(params[:id])
	end

	def new
		@task = @project.tasks.build
	end

	def create
		@task = @project.tasks.build(task_params)
		if @task.save
			redirect_to @project
		else 
			render :new
		end
	end

	def destroy
    @task.destroy
    redirect_to client_projects_path
  end

  protected

  def task_params
  	params.require(:task).permit(:name, :billable)
  end

  def load_task
  	@task = @projects.tasks.find([:id])
  end

  def load_project
    @project = Project.find(params[:project_id])
  end

  def load_client
  	@client = Client.find(params[:client_id])
  end

end
