class TasksController < ApplicationController
before_action :authenticate_user!

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
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
