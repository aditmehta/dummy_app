class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = current_user.tasks.order(position: :desc)
    @new_task = current_user.tasks.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    @save_success = @task.save
    @new_task = current_user.tasks.new
  end

  def sort
    task_ids = params[:ids].collect(&:to_i)
    tasks = Task.where(id: task_ids).group_by(&:id)
    (0...task_ids.length).each do |i|
      task = tasks[task_ids[i]].first
      task.position = task_ids.length - i
      task.save!
    end

    render nothing: true
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