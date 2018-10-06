class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]

  def index
    if is_admin?
      @users = User.all
      json_response(@users)
    else
      json_response({ message: 'Dont have permision' }, :unprocessable_entity)
    end
  end

  def show
    if is_admin?
      json_response(@user)
    else
      json_response({ message: 'Dont have permision' }, :unprocessable_entity)
    end
  end

  def create
    if is_admin?
      @user = User.create!(user_params)
      json_response(@user, :created)
    else
      json_response({ message: 'Dont have permision' }, :unprocessable_entity)
    end
  end

  def update
    if is_admin?
      @user.update(user_params)
      head :no_content
    else
      json_response({ message: 'Dont have permision' }, :unprocessable_entity)
    end
  end

  def destroy
    if is_admin?
      @user.destroy
      head :no_content
    else
      json_response({ message: 'Dont have permision' }, :unprocessable_entity)
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:email,
                  :password,
                  :name,
                  :lastName,
                  :docId,
                  :phone,
                  :address,
                  :is_admin)
  end
end
