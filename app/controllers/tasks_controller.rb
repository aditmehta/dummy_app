class TasksController < ApplicationController
before_action :authenticate_user!

  def index
    @tasks = current_user.tasks
  end

  def new
    @task = current_user.tasks.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      redirect_to root_path, notice: "Task Created Successfully"
    else
      render :new
    end
  end

private

  def task_params
    params.require(:task).permit(:title, :description)
  end
end
