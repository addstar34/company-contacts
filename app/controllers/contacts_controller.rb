class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def index
    @company = Company.find(params[:company_id])
    @contacts = @company.contacts.all
  end

  def show
    @relationships = @contact.relationships
  end

  def new
    @company = Company.find(params[:company_id])
    @contact = @company.contacts.new
  end

  def edit
  end

  def create
    @company = Company.find(params[:company_id])
    @contact = @company.contacts.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to company_contact_path(@company, @contact), notice: 'Contact was successfully created.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to company_contact_path(@company, @contact), notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to company_contacts_url(@company), notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_contact
      @company = Company.includes(:contacts).where(contacts: {id: params[:id]}).find(params[:company_id])
      @contact = @company.contacts.last
    end

    def contact_params
      params.require(:contact).permit(:first_name, :surname, :company_id)
    end
end
