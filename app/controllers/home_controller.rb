class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    if params[:search] && (params[:search].blank? == false)
      @ecclesia = Ecclesium.where("name LIKE ?","%#{params[:search]}%").to_json.html_safe
      @contacts = Contact.where("first_name LIKE ? or last_name LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%").to_json.html_safe
      @ecclesiaNoJson = Ecclesium.where("name LIKE ?","%#{params[:search]}%").sort_by(&:name)
      @contactsNoJson = Contact.where("first_name LIKE ? or last_name LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%").sort_by(&:last_name)

    else
    @ecclesia = Ecclesium.all.to_json.html_safe
    @contacts = Contact.all.to_json.html_safe
    end
  end

end
