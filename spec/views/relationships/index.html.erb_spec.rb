require 'rails_helper'

RSpec.describe "relationships/index", type: :view do
  before(:each) do
    assign(:relationships, [
      Relationship.create!(
        :contact_id => 2,
        :relation_id => 3
      ),
      Relationship.create!(
        :contact_id => 2,
        :relation_id => 3
      )
    ])
  end

  xit "renders a list of relationships" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
