class EcclesiaController < ApplicationController

    def index
      @ecclesia = Ecclesium.all
    end
    def show
      @ecclesium = Ecclesium.find(params[:id])
      @contacts = @ecclesium.contacts
      if @ecclesium.recording_brother_id
        @recording_brother = Contact.find(@ecclesium.recording_brother_id)
      else @recording_brother = Contact.new
        @recording_brother.first_name = "none"
        @recording_brother.last_name =""
      end
    end
    def new
    @ecclesium = Ecclesium.new
    @members = Contact.all
    end
    def create
    @ecclesium = Ecclesium.new(ecclesia_params)
    @ecclesium.save
    if @ecclesium.recording_brother_id
    @recording_brother = Contact.find(@ecclesium.recording_brother_id)
    @recording_brother.ecclesium_id = @ecclesium.id
    @recording_brother.save
    end
    @ecclesia = Ecclesium.all
    @ecclesia.each do |ecclesia|
    if (@ecclesium.recording_brother_id == ecclesia.recording_brother_id) && (@ecclesium.id != ecclesia.id)
      ecclesia.recording_brother_id = nil
      ecclesia.save
    end
  end

    redirect_to @ecclesium
    end
    def edit
    @ecclesium = Ecclesium.find(params[:id])
    @members = @ecclesium.contacts
    end
    def update
      @ecclesium = Ecclesium.find(params[:id])
      @ecclesium.update(ecclesia_params)
      redirect_to @ecclesium
    end
    def destroy
    @ecclesium = Ecclesium.find(params[:id])
    @members = @ecclesium.contacts
    @ecclesium.destroy
    @members.each do |member|
      member.ecclesium_id = nil
      member.save
    end
    redirect_to ecclesia_path
  end



    private
    def ecclesia_params
      params.require(:ecclesium).permit(:name, :postal_address, :longitude, :latitude, :notes, :recording_brother_id)


    end
  end
