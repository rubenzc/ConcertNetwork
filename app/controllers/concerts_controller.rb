class ConcertsController < ApplicationController

  def index
    @concert = Concert.all

  end

  def new
    @concert = Concert.new
  end

  def create
    @concert = Concert.new concert_params

    if@concert.save
      flash[:notice] = "Entry created successfully"
      redirect_to concerts_path
    else
      flash[:alert] = "Something went wrong. Let's repeat the entry"
      render 'new'
    end
  end

  private 

  def concert_params
    params.require(:concert).permit(:artist, :venue, :city, :date, :price, :description)
  end

end
