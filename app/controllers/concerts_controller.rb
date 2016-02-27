class ConcertsController < ApplicationController

  def index
    @today_concerts = Concert.today_concerts
    @actual_month_concerts = Concert.actual_month_concerts
  end

  def new
    @concert = Concert.new
  end

  def show
    @concert = Concert.find params[:id]
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
    @concert = Concert.find params[:id]
  end

  def update
    @concert = Concert.find params[:id]

    if @concert.update_attributes concert_params
      redirect_to action: 'index'
    else
      render 'edit'
    end
  end

  def destroy
    concert = Concert.find params[:id]
    concert.destroy

    redirect_to action: 'index'
  end

  private 

  def concert_params
    params.require(:concert).permit(:artist, :venue, :city, :date, :price, :description)
  end

end
