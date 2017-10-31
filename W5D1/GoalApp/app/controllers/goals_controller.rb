class GoalsController < ApplicationController
  def new
  end

  def edit
    @goal=Goal.find(params[:id])
  end

  def index
  end

  def create
  end

  def show
    @goal=Goal.find(params[:id])
  end
end
