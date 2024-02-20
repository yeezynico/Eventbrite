class AttendanceMailer < ApplicationMailer
  default from: ENV['MAILJET_DEFAULT_FROM']

  def new_attendee_email(attendance)
    @attendance = attendance
    @admin = User.find(@attendance.event.admin_id)
    @url  = 'http://localhost:3000/login' 
    mail(to: @admin.email, subject: "You have a new guest !") 
  end
end