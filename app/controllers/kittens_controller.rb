class KittensController < ApplicationController
  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      flash[:notice] = 'A kitten is born!'
      redirect_to @kitten
    else
      flash[:alert] = 'Is it that hard to fill in a simple form...?'
      render '/kittens/new'
    end
  end

  def show
    @kitten = Kitten.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @kitten }
    end
  end

  def index
    @kittens = Kitten.all
    respond_to do |format|
      format.html
      format.json { render json: @kittens }
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
    flash[:notice] = 'A kitten is updated!'
  end

  def update
    @kitten = Kitten.find(params[:id])
    @kitten.update(kitten_params)
    redirect_to @kitten
  end

  def destroy
    Kitten.find(params[:id]).destroy
    flash[:notice] = 'A kitten is gone!'
    redirect_to '/'
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
