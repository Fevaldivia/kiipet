class BookingsController < ApplicationController
  before_action :authenticate_user!
  respond_to :html, :xml, :json

  before_action :find_calendar

  def index
    @bookings = Booking.where("calendar_id = ? AND end_time >= ?", @calendar.id, Time.now).order(:start_time)
    respond_with @bookings
  end

  def new
    @profiles = @calendar.profile
    @booking = Booking.new(calendar_id: @calendar.id)
  end

  def create
    binding.pry
    @booking =  Booking.new(params[:booking].permit(:calendar_id, :start_time, :length))
    @booking.calendar = @calendar
    if @booking.save
      redirect_to calendar_bookings_path(@calendar, method: :get)
    else
      render 'new'
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def destroy
    @booking = Booking.find(params[:id]).destroy
    if @booking.destroy
      flash[:notice] = "Booking: #{@booking.start_time.strftime('%e %b %Y %H:%M%p')} to #{@booking.end_time.strftime('%e %b %Y %H:%M%p')} deleted"
      redirect_to calendar_bookings_path(@calendar)
    else
      render 'index'
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    # @booking.calendar = @calendar

    if @booking.update(params[:booking].permit(:calendar_id, :start_time, :length))
      flash[:notice] = 'Your booking was updated succesfully'

      if request.xhr?
        render json: {status: :success}.to_json
      else
        redirect_to calendar_bookings_path(@calendar)
      end
    else
      render 'edit'
    end
  end

  private

  def save booking
    if @booking.save
        flash[:notice] = 'booking added'
        redirect_to calendar_booking_path(@calendar, @booking)
      else
        render 'new'
      end
  end

  def find_calendar
    if params[:calendar_id]
      @calendar = Calendar.find_by_id(params[:calendar_id])
    end
  end

end
