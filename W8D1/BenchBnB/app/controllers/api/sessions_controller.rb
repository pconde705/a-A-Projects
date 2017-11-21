class Api::SessionsController < ApplicationController

  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if user
      sign_in(user)
      render 'api/users/show'
    else
      flash.now[:errors] = ['Invalid username or password']
    end
  end

  def destroy
    if signed_in?
      sign_out
    else
      render status: 404
    end
    render json: {}
  end
end
