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

  end

  def create

  end


end
