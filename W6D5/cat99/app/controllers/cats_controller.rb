class CatsController 
  def index
    @cat = Cat.all

    render :index 
  end
end