class AppointmentsController < ApplicationController

    before_action :set_course
  
    def index
      @date = @doctor.appointments.where(date: 'November')
      @date1 = @doctor.appointments.where(date: 'December')
      @date2 = @doctor.appointments.where(date: 'January')
    end
  
    def new
      @appointment = @doctor.appointments.new
    end
  
    def create
      @appointment = @doctor.appointments.new(appointment_params)
      if @appointment.save
        redirect_to doctor_appointments_path
      else
        render :new
      end
    end
  
    def destroy
      appointment = @doctor.appointments.find(params[:id])
      appointment.destroy
      redirect_to doctor_users_path
    end
  
   private
     def set_course
       @doctor = Doctor.find(params[:doctor_id]) 
     end
  
     def enrollment_params
       params.require(:appointment).permit(:date, :user_id)
     end
  end