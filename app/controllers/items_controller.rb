class ItemsController < ApplicationController

  def index
    @items = Item.includes(:images).order('created_at DESC')
  end

  def show
  end
  
  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
  end

  def new
  end
end
