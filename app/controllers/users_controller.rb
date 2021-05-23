class UsersController < ApplicationController

  def index
    users = User.all()
    if users
      render status: :ok, json: { users: users.as_json(:except => [:password_digest, :updated_at, :created_at]) }
    else 
      render status: :internal_server_error, json: { notice: t('something_went_worng')}
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render status: :ok, json: { notice: t('successfully_created', entity: 'User') }
    else
      render status: :unprocessable_entity, json: {
        errors: @user.errors.full_messages.to_sentence
      }
    end
  end

  private 
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
