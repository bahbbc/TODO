class TasksController < ApplicationController

def new 
	@task = Task.new
end

def create
  @task = Task.new(params[:task].permit(:title))	
  if @task.save
    redirect_to tasks_path
  else
    render 'new'
  end
end   
  
def show
	@task = Task.find(params[:id])
end

def index
  @tasks = Task.all
end
  
def destroy
  @task = Task.find(params[:id])
  @task.destroy
 
  redirect_to tasks_path
end

private
	def task_params
		params.require(:task).permit(:title)
	end  

end
