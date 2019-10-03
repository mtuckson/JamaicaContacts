class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @ecclesia = Ecclesium.all.to_json.html_safe
    @contacts = Contact.all.to_json.html_safe
  #  binding.pry
  end
end
