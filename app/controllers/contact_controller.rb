# coding: utf-8

class ContactController < ApplicationController

  def contact_form
    
    ref = request.headers["Referer"]
    @referer = ref.nil? ? "http://www.checkpass.jp" : URI.encode(ref)
    respond_to do |format|
      format.html 
    end
  end

  def create
    @referer = params[:referer]
    @contact = Contact.new(params[:contact])
    if @contact.save
      ContactMailer.sent(@contact).deliver
      respond_to do |format|
        format.html 
      end
    else
      render :action => :contact_form, :alert => 'お問い合わせに不備があります。'
    end
  end
end
