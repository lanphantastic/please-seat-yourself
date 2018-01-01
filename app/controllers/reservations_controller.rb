class ReservationsController < ApplicationController

  def confirm
    @reservation = @restaurant.reservations.find(params[:id])
    @reservation.status = "confirmed"
    @reservation.save!
    @reservation.send_confirmation_sms

    flash[:notice] = "The reservation for #{@reservation.user.name} has been confirmed"
    redirect_to admin_path
  end

  def cancel
    @reservation = @restaurant.reservations.find(params[:id])
    @reservation.status = "cancelled"
    @reservation.save

    flash[:notice] = "The reservation for #{@reservation.user.name} has been cancelled"
    redirect_to admin_path
  end

  def new
    @reservation = @restaurant.reservations.new
  end

  def create
    @reservation = @restaurant.reservations.new(reservation_params)
    @reservation.user_id = current_user.id

    if @reservation.save
      flash[:notice] = "Thanks for choosing us. Please wait for a confirmation of your reservation"
      redirect_to restaurant_url(@restaurant)
    else
      flash[:alert] = "Sorry. Your reservation couldn't be processed."
      render :new
    end
  end


end
