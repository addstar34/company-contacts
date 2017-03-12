require 'rails_helper'

RSpec.describe "relationships/edit", type: :view do
  before(:each) do
    @relationship = assign(:relationship, Relationship.create!(
      :contact_id => 1,
      :relation_id => 1
    ))
  end

  xit "renders the edit relationship form" do
    render

    assert_select "form[action=?][method=?]", relationship_path(@relationship), "post" do

      assert_select "input#relationship_contact_id[name=?]", "relationship[contact_id]"

      assert_select "input#relationship_relation_id[name=?]", "relationship[relation_id]"
    end
  end
end
