class RelationshipsController < ApplicationController
  before_action :set_company_and_contact, only: [:index, :new, :create, :destroy]

  def index
    @relationships = @contact.relationships
  end

  def new
    @relationship = @contact.relationships.build
    existing_relations = @contact.relationships.pluck(:relation_id) << @contact.id
    @available_contacts = @company.contacts.where.not(id: existing_relations)
  end

  def create
    relation = @company.contacts.find_by(id: relationship_params[:relation_id])
    @relationship = relation ? @contact.relationships.build(relation_id: relation.id) : @contact.relationships.build

    respond_to do |format|
      if @relationship.save
        format.html { redirect_to company_contact_relationships_path(@company, @contact), notice: 'Relationship was successfully created.' }
        format.json { render :show, status: :created, location: @relationship }
      else
        format.html { render :new }
        format.json { render json: @relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @relationship = @contact.relationships.find(params[:id])

    @relationship.destroy
    respond_to do |format|
      format.html { redirect_to company_contact_relationships_url(@company, @contact), notice: 'Relationship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_company_and_contact
      @company = Company.includes(:contacts).where(contacts: {id: params[:contact_id]}).find(params[:company_id])
      @contact = @company.contacts.last
    end

    def relationship_params
      params.require(:relationship).permit(:contact_id, :relation_id)
    end
end
