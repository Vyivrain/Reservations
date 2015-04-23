class ReservationsController < ApplicationController

  def index
  end

  def create
    date = ParamsProcessing.date_processing(params[:date])
    start_time = ParamsProcessing.time_processing(params[:start_time])
    end_time = ParamsProcessing.time_processing(params[:end_time])

    reservation = Reservation.new(
      start_time: Time.gm(date[0], date[1], date[2], start_time[0], start_time[1]),
      end_time: Time.gm(date[0], date[1], date[2], end_time[0], end_time[1]),
      table_number: params[:table_number]
    )

    if reservation.save
      render json: { message: 'All ok' }, status: :ok
    else
      render json: reservation.errors.messages, status: :bad_request
    end
  end
end
