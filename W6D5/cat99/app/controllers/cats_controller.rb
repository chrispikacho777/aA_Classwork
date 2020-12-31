class CatsController < ApplicationController
  def index
    @cat = Cat.all

    render :index 
  end
end