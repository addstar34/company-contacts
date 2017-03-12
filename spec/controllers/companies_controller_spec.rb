require 'rails_helper'

RSpec.describe CompaniesController, type: :controller do
  let(:valid_attributes) {
    { name: "Cool Company" }
  }

  let(:invalid_attributes) {
    { name: "" }
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all companies as @companies" do
      company = Company.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:companies)).to eq([company])
    end
  end

  describe "GET #show" do
    it "assigns the requested company as @company" do
      company = Company.create! valid_attributes
      get :show, params: {id: company.to_param}, session: valid_session
      expect(assigns(:company)).to eq(company)
    end

    it "assigns the last 3 created contacts to @contacts" do
      company = FactoryGirl.create(:company_with_contacts, contacts_count: 5)
      contacts = company.contacts.order(created_at: :desc).limit(3)
      get :show, params: {id: company.to_param}, session: valid_session
      expect(assigns(:contacts)).to eq(contacts)
    end
  end

  describe "GET #new" do
    it "assigns a new company as @company" do
      get :new, params: {}, session: valid_session
      expect(assigns(:company)).to be_a_new(Company)
    end
  end

  describe "GET #edit" do
    it "assigns the requested company as @company" do
      company = Company.create! valid_attributes
      get :edit, params: {id: company.to_param}, session: valid_session
      expect(assigns(:company)).to eq(company)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Company" do
        expect {
          post :create, params: {company: valid_attributes}, session: valid_session
        }.to change(Company, :count).by(1)
      end

      it "assigns a newly created company as @company" do
        post :create, params: {company: valid_attributes}, session: valid_session
        expect(assigns(:company)).to be_a(Company)
        expect(assigns(:company)).to be_persisted
      end

      it "redirects to the created company" do
        post :create, params: {company: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Company.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved company as @company" do
        post :create, params: {company: invalid_attributes}, session: valid_session
        expect(assigns(:company)).to be_a_new(Company)
      end

      it "re-renders the 'new' template" do
        post :create, params: {company: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { name: "Coolest Company" }
      }

      it "updates the requested company" do
        company = Company.create! valid_attributes
        put :update, params: {id: company.to_param, company: new_attributes}, session: valid_session
        company.reload
        expect(company.name).to eq(new_attributes[:name])
      end

      it "assigns the requested company as @company" do
        company = Company.create! valid_attributes
        put :update, params: {id: company.to_param, company: valid_attributes}, session: valid_session
        expect(assigns(:company)).to eq(company)
      end

      it "redirects to the company" do
        company = Company.create! valid_attributes
        put :update, params: {id: company.to_param, company: valid_attributes}, session: valid_session
        expect(response).to redirect_to(company)
      end
    end

    context "with invalid params" do
      it "assigns the company as @company" do
        company = Company.create! valid_attributes
        put :update, params: {id: company.to_param, company: invalid_attributes}, session: valid_session
        expect(assigns(:company)).to eq(company)
      end

      it "re-renders the 'edit' template" do
        company = Company.create! valid_attributes
        put :update, params: {id: company.to_param, company: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested company" do
      company = Company.create! valid_attributes
      expect {
        delete :destroy, params: {id: company.to_param}, session: valid_session
      }.to change(Company, :count).by(-1)
    end

    it "redirects to the companies list" do
      company = Company.create! valid_attributes
      delete :destroy, params: {id: company.to_param}, session: valid_session
      expect(response).to redirect_to(companies_url)
    end
  end

end
