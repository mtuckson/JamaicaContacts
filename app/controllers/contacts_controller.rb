class ContactsController < ApplicationController
  before_action :authenticate_user!
  def index
    @contacts = Contact.all.sort_by(&:full_name)
  end
  def show
    @contact = Contact.find(params[:id])
    @contactToJson = @contact.to_json.html_safe
    if @contact.ecclesium_id
      @ecclesium = Ecclesium.find(@contact.ecclesium_id)
    else @ecclesium = Ecclesium.new
      @ecclesium.name ="none"
    end
  end
  def new
    @contact = Contact.new
    @ecclesia = Ecclesium.all
    @phone_descriptions = get_phone_descriptions
  end
  def create
    @contact = Contact.new(contact_params)
    @contact.save
    redirect_to @contact
  end
  def edit
    @contact = Contact.find(params[:id])
    @ecclesia = Ecclesium.all.sort_by(&:name)
    @phone_descriptions = get_phone_descriptions
  end
  def update
    @contact = Contact.find(params[:id])
    @contact.update(contact_params)
    redirect_to @contact
  end
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    @ecclesia = Ecclesium.all
    @ecclesia.each do |ecclesia|
      if @contact.id == ecclesia.recording_brother_id
        ecclesia.recording_brother_id = nil
        ecclesia.save
      end
    end

    redirect_to contacts_path
  end



  private
  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :alias, :phone_number,
      :email_address, :postal_address, :longitude,
      :latitude, :baptism_status, :gender, :birth_date,
      :notes, :ecclesium_id, :avatar, :second_phone, :third_phone,
      :phone_description, :second_phone_description, :third_phone_description)
    end

    def get_phone_descriptions
        descriptions = Contact.pluck(:phone_description) + Contact.pluck(:second_phone_description) + Contact.pluck(:third_phone_description)
        descriptions.uniq
    end

end
