require 'rails_helper'

RSpec.describe RelationshipsController, type: :controller do
  let(:company_with_contacts) { FactoryGirl.create(:company_with_contacts) }
  let(:company) { company_with_contacts }
  let(:contact) { company_with_contacts.contacts[0] }
  let(:relation) { company_with_contacts.contacts[1] }
  let(:another_company) { FactoryGirl.create(:company_with_contacts, name: "Another Company") }
  let(:another_company_contact) { another_company.contacts[0] }

  let(:valid_attributes) {
    { relation_id: relation.id }
  }

  let(:invalid_attributes) {
    { relation_id: "freddo" }
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all relationships as @relationships" do
      relationship = contact.relationships.create! valid_attributes
      get :index, params: { company_id: company.id, contact_id: contact.id }, session: valid_session
      expect(assigns(:relationships)).to eq([relationship])
    end
  end

  describe "GET #new" do
    it "assigns a new relationship as @relationship" do
      get :new, params: { company_id: company.id, contact_id: contact.id }, session: valid_session
      expect(assigns(:relationship)).to be_a_new(Relationship)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Relationship" do
        expect {
          post :create, params: { relationship: valid_attributes, company_id: company.id, contact_id: contact.id }, session: valid_session
        }.to change(Relationship, :count).by(1)
      end

      it "assigns a newly created relationship as @relationship" do
        post :create, params: {relationship: valid_attributes, company_id: company.id, contact_id: contact.id}, session: valid_session
        expect(assigns(:relationship)).to be_a(Relationship)
        expect(assigns(:relationship)).to be_persisted
      end

      it "redirects to the relationships index for the contact" do
        post :create, params: {relationship: valid_attributes, company_id: company.id, contact_id: contact.id}, session: valid_session
        expect(response).to redirect_to company_contact_relationships_path(company.id, contact.id)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved relationship as @relationship" do
        post :create, params: {relationship: invalid_attributes, company_id: company.id, contact_id: contact.id}, session: valid_session
        expect(assigns(:relationship)).to be_a_new(Relationship)
      end

      it "doesn't allow creating a relationship with a contact from another company" do
        post :create, params: {relationship: {relation_id: another_company_contact.id}, company_id: company.id, contact_id: contact.id}, session: valid_session
        expect(assigns(:relationship)).to be_a_new(Relationship)
        expect(response).to render_template("new")
      end

      it "re-renders the 'new' template" do
        post :create, params: {relationship: invalid_attributes, company_id: company.id, contact_id: contact.id}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested relationship when made by the contact" do
      relationship = contact.relationships.create! valid_attributes
      expect {
        delete :destroy, params: {id: relationship.to_param, company_id: company.id, contact_id: contact.id}, session: valid_session
      }.to change(Relationship, :count).by(-1)
    end

    it "destroys the requested relationship when made by another contact (inverse)" do
      relationship = contact.relationships.create! valid_attributes
      expect {
        delete :destroy, params: {id: relationship.to_param, company_id: company_with_contacts.id, contact_id: relation.id}, session: valid_session
      }.to change(Relationship, :count).by(-1)
    end

    it "redirects to the relationships list" do
      relationship = contact.relationships.create! valid_attributes
      delete :destroy, params: {id: relationship.to_param, company_id: company_with_contacts.id, contact_id: company_with_contacts.contacts[0].id}, session: valid_session
      expect(response).to redirect_to company_contact_relationships_path(company, contact)
    end
  end

end
