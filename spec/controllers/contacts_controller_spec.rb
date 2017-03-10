require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
  let(:company) { FactoryGirl.create(:company) }

  let(:valid_attributes) {
    { first_name: "Harry", surname: "Potter", company_id: company.id }
  }

  let(:invalid_attributes) {
    { first_name: "", surname: "" }
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all contacts as @contacts" do
      contact = Contact.create! valid_attributes
      get :index, params: {company_id: company.id}, session: valid_session
      expect(assigns(:contacts)).to eq([contact])
    end
  end

  describe "GET #show" do
    it "assigns the requested contact as @contact" do
      contact = Contact.create! valid_attributes
      get :show, params: {company_id: company.id, id: contact.to_param}, session: valid_session
      expect(assigns(:contact)).to eq(contact)
    end
  end

  describe "GET #new" do
    it "assigns a new contact as @contact" do
      get :new, params: {company_id: company.id}, session: valid_session
      expect(assigns(:contact)).to be_a_new(Contact)
    end
  end

  describe "GET #edit" do
    it "assigns the requested contact as @contact" do
      contact = Contact.create! valid_attributes
      get :edit, params: {company_id: company.id, id: contact.to_param}, session: valid_session
      expect(assigns(:contact)).to eq(contact)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Contact" do
        expect {
          post :create, params: {company_id: company.id, contact: valid_attributes}, session: valid_session
        }.to change(Contact, :count).by(1)
      end

      it "assigns a newly created contact as @contact" do
        post :create, params: {company_id: company.id, contact: valid_attributes}, session: valid_session
        expect(assigns(:contact)).to be_a(Contact)
        expect(assigns(:contact)).to be_persisted
      end

      it "redirects to the created contact" do
        post :create, params: {company_id: company.id, contact: valid_attributes}, session: valid_session
        expect(response).to redirect_to(company_contact_path(company, Contact.last))
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved contact as @contact" do
        post :create, params: {company_id: company.id, contact: invalid_attributes}, session: valid_session
        expect(assigns(:contact)).to be_a_new(Contact)
      end

      it "re-renders the 'new' template" do
        post :create, params: {company_id: company.id, contact: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { surname: "Pott" }
      }

      it "updates the requested contact" do
        contact = Contact.create! valid_attributes
        put :update, params: {company_id: company.id, id: contact.to_param, contact: new_attributes}, session: valid_session
        contact.reload
        expect(contact.surname).to eq(new_attributes[:surname])
      end

      it "assigns the requested contact as @contact" do
        contact = Contact.create! valid_attributes
        put :update, params: {company_id: company.id, id: contact.to_param, contact: valid_attributes}, session: valid_session
        expect(assigns(:contact)).to eq(contact)
      end

      it "redirects to the contact" do
        contact = Contact.create! valid_attributes
        put :update, params: {company_id: company.id, id: contact.to_param, contact: valid_attributes}, session: valid_session
        expect(response).to redirect_to company_contact_path(company, contact)
      end
    end

    context "with invalid params" do
      it "assigns the contact as @contact" do
        contact = Contact.create! valid_attributes
        put :update, params: {company_id: company.id, id: contact.to_param, contact: invalid_attributes}, session: valid_session
        expect(assigns(:contact)).to eq(contact)
      end

      it "re-renders the 'edit' template" do
        contact = Contact.create! valid_attributes
        put :update, params: {company_id: company.id, id: contact.to_param, contact: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested contact" do
      contact = Contact.create! valid_attributes
      expect {
        delete :destroy, params: {company_id: company.id, id: contact.to_param}, session: valid_session
      }.to change(Contact, :count).by(-1)
    end

    it "redirects to the contacts list" do
      contact = Contact.create! valid_attributes
      delete :destroy, params: {company_id: company.id, id: contact.to_param}, session: valid_session
      expect(response).to redirect_to company_contacts_path(company)
    end
  end

end
