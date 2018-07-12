# frozen_string_literal: true

class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome_email.subject
  #
  def welcome_email
    @full_name = "#{params[:user].first_name} #{params[:user].last_name}"

    mail to: params[:user].email, subject: 'Welcome, Bienvenue'
  end
end
