class CartsController < ApplicationController

  include CartsHelper
  
  before_action :is_owner, only: [:show, :edit, :update, :destroy]

  def index
    @carts = @current_cart
  end

  def show
    @cart = Cart.find(params[:id])
  end

  def create
    @cart = Cart.new(user_id: current_user.id)
    if @cart.save
      flash[:success] = "Cart created"
      redirect_to controller:'carts', action: 'show', id: @cart.id
    else
      render root_path
    end
  end

  def update
    
  end

  private

  def is_owner
    if Cart.find(session[:cart_id]).id.to_i != params[:id].to_i
      redirect_to "/"
      flash[:warning] = "You cannot see other users' carts!"
    end
  end
  
end
