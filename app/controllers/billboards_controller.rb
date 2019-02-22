class BillboardsController < ApplicationController
before_action :set_billboard, only: [:show, :update, :edit, :destroy]
  
  def index
    @billboards = Billboard.all
  end

  def show
  end

  def new
    @billboard = Billboard.new
    render partial: "billboards/form"
  end

  def edit
    render partial: "billboards/form"
  end

  def create
    @billboard = Billboard.new(billboard_params)

    if @billboard.save
      redirect_to @billboard
    else
      render :new
    end
  end

  def update
    if @billboard.update(billboard_params)
      redirect_to @billboard
    else
      render :edit
    end
  end

  def destroy
    # binding.pry
    @billboard.destroy
    redirect_to billboards_path
  end

  private
  def set_billboard
    @billboard = Billboard.find(params[:id])
  end

  def billboard_params
    params.require(:billboard).permit(:name)
  end


end
