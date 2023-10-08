class TasksController < ApplicationController
  def index
   @tasks = Task.all


    if ['high', 'medium', 'low'].include?(params[:priority])
      @tasks = @tasks.where(priority: params[:priority])
    end

    if params[:status].present?
      @tasks = @tasks.where(status: params[:status])
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
   @task = Task.find(params[:id])
    if @task.update(task_params)
     redirect_to tasks_path, notice: 'Task updated successfully'
    else
      render 'new'
    end
  end

  def new
   @task = Task.new
  end

  def create
    if params[:task][:status] == 'incomplete'
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: 'Task created successfully'
    else
      logger.debug @task.errors.full_messages
      render 'new'
    end
  end
end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, alert: "Removed Succesfully "
  end

  private
  def task_params
    params.require(:task).permit(:title, :description, :due_date, :status, :priority)
  end
end


