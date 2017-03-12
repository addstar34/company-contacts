require 'rails_helper'

RSpec.describe "relationships/new", type: :view do
  before(:each) do
    assign(:relationship, Relationship.new(
      :contact_id => 1,
      :relation_id => 1
    ))
  end

  xit "renders new relationship form" do
    render

    assert_select "form[action=?][method=?]", relationships_path, "post" do

      assert_select "input#relationship_contact_id[name=?]", "relationship[contact_id]"

      assert_select "input#relationship_relation_id[name=?]", "relationship[relation_id]"
    end
  end
end
