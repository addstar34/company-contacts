require 'rails_helper'

RSpec.describe "relationships/show", type: :view do
  before(:each) do
    @relationship = assign(:relationship, Relationship.create!(
      :contact_id => 2,
      :relation_id => 3
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
