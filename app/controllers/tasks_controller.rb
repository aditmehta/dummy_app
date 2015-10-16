class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = current_user.tasks.all.reverse
    @new_task = current_user.tasks.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    @save_success = @task.save
    @new_task = current_user.tasks.new
  end

  def destroy
    @task = current_user.tasks.find(params[:id])
    @task.destroy
  end

private
  def task_params
    params.require(:task).permit(:title, :description)
  end
end