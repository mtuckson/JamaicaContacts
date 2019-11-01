class ContactsController < ApplicationController
  before_action :authenticate_user!
  def index
    @contacts = Contact.all.sort_by(&:full_name)
  end
  def show
    @contact_with_blanks = Contact.find(params[:id])
    @contact = fill_the_blanks(@contact_with_blanks)
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
  end
  def create
    @contact = Contact.new(contact_params)
    @contact.save
    redirect_to @contact
  end
  def edit
    @contact = Contact.find(params[:id])
    @ecclesia = Ecclesium.all.sort_by(&:name)
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
      :notes, :ecclesium_id, :avatar)
    end

    def fill_the_blanks (contact)

        if contact.phone_number.blank?
          contact.phone_number = "-"
        end

        if contact.email_address.blank?
          contact.email_address = "-"
        end

        if contact.postal_address.blank?
          contact.postal_address = "-"
        end

        if contact.latitude.blank?
          contact.latitude = "-"
        end

        if contact.birth_date.blank?
          contact.birth_date = "-"
        end

        if contact.notes.blank?
          contact.notes = "-"
        end

        return contact

    end

  end
