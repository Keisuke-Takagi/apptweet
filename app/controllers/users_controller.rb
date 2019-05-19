class UsersController < ApplicationController
  def search
    @products = Product.where('nickname LIKE(?)', "%#{params[:keyword]}%").limit(20).page(params[:page]).per(5).order("created_at DESC")
  end
end
