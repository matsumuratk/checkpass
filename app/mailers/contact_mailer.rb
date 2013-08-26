# coding: utf-8

class ContactMailer < ActionMailer::Base
  default from: "info@checkpass.jp"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.sent.subject
  #

  def sent(contact)
    @contact = contact

    mail(:to => @contact.email, 
        :bcc => 'info@checkpass.jp',        
        :subject => 'お問い合わせありがとうございました。')
  end

end


