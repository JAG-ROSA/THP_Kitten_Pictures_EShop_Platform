class CartItemsController < ApplicationController
  def create
    chosen_product = Item.find(params[:product_id])
    current_cart = @current_cart

    # If cart already has this product then find the relevant line_item and iterate quantity otherwise create a new line_item for this product
    if current_cart.items.include?(chosen_product)
      # Find the line_item with the chosen_product
      @cart_item = current_cart.cart_items.find_by(:item_id => chosen_product)
      # Iterate the line_item's quantity by one
      @cart_item.quantity += 1
    else
      @cart_item = CartItem.new(quantity: params[:quantity], cart_id: current_cart, item_id: chosen_product)
    end

    # Save and redirect to cart show path
    @cart_item.save
    redirect_to cart_path(current_cart)
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    @cart = @cart_item.cart

    @flash = [["warning", "Item removed from the cart"]]

    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.js { }
    end
  end

  def add_quantity
    @cart_item = CartItem.find(params[:id])
    @cart_item.quantity += 1
    @cart_item.save

    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.js { }
    end
  end

  def reduce_quantity
    @cart_item = CartItem.find(params[:id])
    if @cart_item.quantity > 1
      @cart_item.quantity -= 1
    end
    @cart_item.save

    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.js { }
    end
  end
end
