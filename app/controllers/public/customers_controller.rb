class Public::CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
    @posts = customer.posts
  end

  def index
    @customers = Customers.all
  end
  
  def edit
    @customer = Customer.find(params[:id])
    if @customer.id == current_customer.id
    else
       redirect_to customer_path(current_customer.id)
    end
  end

  def customer_params
    params.require(:customer).permit(:nickname, :profile_image, :introduction)
  end


end
