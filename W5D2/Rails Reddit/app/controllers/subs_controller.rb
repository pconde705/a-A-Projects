class SubsController < ApplicationController
  before_action :require_logged_in, only: [:new, :create, :edit, :update, :destroy]

  def index
    @subs = Sub.all
  end

  def new
    @sub = Sub.new
  end

  def create
    @sub = Sub.new(subs_params)
    @sub.moderator_id = current_user.id

    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def edit
    @sub = Sub.find(params[:id])
  end

  def update
    @sub = current_user.subs.find(params[:id])

    if @sub.update_attributes(subs_params)
      redirect_to sub_url(@link)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def destroy
    @sub = current_user.subs.find(params[:id])
    @sub.destroy
    redirect_to subs_url
  end

  private
  def subs_params
    params.require(:sub).permit(:title, :description)
  end
end
