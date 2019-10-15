class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    if params[:search]
      @ecclesia = Ecclesium.where("name LIKE ?","%#{params[:search]}%").to_json.html_safe
      @contacts = Contact.where("first_name LIKE ? or last_name LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%").to_json.html_safe
      @ecclesiaNoJson = Ecclesium.where("name LIKE ?","%#{params[:search]}%")
      @contactsNoJson = Contact.where("first_name LIKE ? or last_name LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")

    else
    @ecclesia = Ecclesium.all.to_json.html_safe
    @contacts = Contact.all.to_json.html_safe
    end
  end

end
