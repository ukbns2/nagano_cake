class Public::CustomersController < ApplicationController
  def show
    @customer = Custmer.find(params[:id])
  end

  def edit
  end

  def detain
  end
end
