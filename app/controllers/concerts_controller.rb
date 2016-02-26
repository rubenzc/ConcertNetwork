class ConcertsController < ApplicationController

  def index
    @today_concerts = Concert.today_concerts
    @actual_month_concerts = Concert.actual_month_concerts
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

  def edit
  end

  private 

  def concert_params
    params.require(:concert).permit(:artist, :venue, :city, :date, :price, :description)
  end

end
