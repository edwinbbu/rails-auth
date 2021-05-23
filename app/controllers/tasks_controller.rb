class TasksController < ApplicationController
  before_action :authenticate_user_using_x_auth_token, except: [:new, :edit]

  def index
    tasks = policy_scope(Task)
    if tasks
      render status: :ok, json: { tasks: tasks }
    else
      render status: :internal_server_error, json: { errors: ["Something went wrong"]}
    end
  end

  def create
    @task = Task.new(task_params.merge(user_id: @current_user.id))
    if @task.save
      render status: :ok, json: { task: @task.as_json(:except => [:created_at, :updated_at]) }
    else 
      render status: :unprocessable_entity, json: { errors: @task.errors.full_messages.to_sentence}
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :description)
  end

end