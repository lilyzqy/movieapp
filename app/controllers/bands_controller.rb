class BandsController < ApplicationController
  def index
    @bands = Band.all
    render :index
  end

  def create
    @band = Band.new(name: params[:name])
    if @band.save
      redirect_to :show
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def new
    render :new
  end

  def edit
    render :edit
  end

  def update
    @band = Band.find(id:params[:id])
    if @band.update(name: params[:name])
      redirect_to :show
    else
      flash.now[:errors] = @band.errors.full_messages
      render :edit
    end
  end

  def show
    render :show
  end

  def destroy
    @band = Band.find(id:params[:id])
    @band.destroy
    redirect_to :index
  end
end
