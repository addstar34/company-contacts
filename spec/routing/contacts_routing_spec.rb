require "rails_helper"

RSpec.describe ContactsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(get: "/companies/1/contacts").to route_to("contacts#index", company_id: "1")
    end

    it "routes to #new" do
      expect(get: "/companies/1/contacts/new").to route_to("contacts#new", company_id: "1")
    end

    it "routes to #show" do
      expect(get: "/companies/1/contacts/1").to route_to("contacts#show", company_id: "1", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/companies/1/contacts/1/edit").to route_to("contacts#edit", company_id: "1", id: "1")
    end

    it "routes to #create" do
      expect(post: "/companies/1/contacts").to route_to("contacts#create", company_id: "1")
    end

    it "routes to #update via PUT" do
      expect(put: "/companies/1/contacts/1").to route_to("contacts#update", company_id: "1", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/companies/1/contacts/1").to route_to("contacts#update", company_id: "1", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/companies/1/contacts/1").to route_to("contacts#destroy", company_id: "1", id: "1")
    end

  end
end
