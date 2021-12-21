class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def destroy
    @customer = Customer.find(params[:id])
    if @customer.destroy
      redirect_back(fallback_location: root_path)
    end
  end

end
