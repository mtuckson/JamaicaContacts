class ContactsController < ApplicationController
  before_action :authenticate_user!
  def index
    @contacts = Contact.all.sort_by(&:last_name)
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

    contact_ecclesium_id_before_update = @contact.ecclesium_id

    @contact.update(contact_params)

    contact_ecclesium_id_after_update = @contact.ecclesium_id
    if_ecclesia_change_check_recording_brother_status(@contact,contact_ecclesium_id_before_update, contact_ecclesium_id_after_update)
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

    def if_ecclesia_change_check_recording_brother_status(contact, contact_ecclesium_id_before_update, contact_ecclesium_id_after_update)

        if contact_ecclesium_id_before_update == contact_ecclesium_id_after_update
        return
      end
      if contact_ecclesium_id_before_update.blank?
        return
      end
      ecclesia_before = Ecclesium.find_by_id(contact_ecclesium_id_before_update)
      if ecclesia_before.recording_brother_id == contact.id
        ecclesia_before.recording_brother_id = nil
        ecclesia_before.save
      end
    end

    def get_phone_descriptions
        descriptions = Contact.pluck(:phone_description) + Contact.pluck(:second_phone_description) + Contact.pluck(:third_phone_description)
        descriptions.uniq
    end

end
