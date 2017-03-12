require "rails_helper"

RSpec.describe RelationshipsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/companies/1/contacts/1/relationships").to route_to("relationships#index", company_id: "1", contact_id: "1")
    end

    it "routes to #new" do
      expect(:get => "/companies/1/contacts/1/relationships/new").to route_to("relationships#new", company_id: "1", contact_id: "1")
    end

    it "routes to #create" do
      expect(:post => "/companies/1/contacts/1/relationships").to route_to("relationships#create", company_id: "1", contact_id: "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/companies/1/contacts/1/relationships/1").to route_to("relationships#destroy", company_id: "1", contact_id: "1", id: "1")
    end

  end
end
