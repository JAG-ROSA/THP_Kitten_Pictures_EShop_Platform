class UsersController < ApplicationController
  def index
  end

  def new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
  end

  def show
  end

  def update
  end

  def destroy
  end
end
