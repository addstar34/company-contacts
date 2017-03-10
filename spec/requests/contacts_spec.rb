require 'rails_helper'

RSpec.describe "Contacts", type: :request do
  describe "GET /companies/1/contacts" do
    let(:company) { FactoryGirl.create(:company) }

    it "works! (now write some real specs)" do
      get company_contacts_path(company)
      expect(response).to have_http_status(200)
    end
  end
end
