# frozen_string_literal: true

# Users controller for sign up and stuff
class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update show destroy]
  before_action :require_user, only: %i[edit update destroy]
  before_action :require_same_user, only: %i[edit update destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = 'Thanks for sign up'
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:notice] = 'Info updated'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def show
    @articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def destroy
    session[:user_id] = nil if @user == current_user
    @user.destroy
    flash[:notice] = 'Account and articles deleted'
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :username)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    return if current_user == @user || current_user.admin?

    flash[:alert] = 'You can only edit your own profile'
    redirect_to @user
  end
end
