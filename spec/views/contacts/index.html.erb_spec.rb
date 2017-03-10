require 'rails_helper'

RSpec.describe "contacts/index", type: :view do
  before(:each) do
    assign(:contacts, [
      Contact.create!(
        :first_name => "First Name",
        :surname => "Surname",
        :company => nil
      ),
      Contact.create!(
        :first_name => "First Name",
        :surname => "Surname",
        :company => nil
      )
    ])
  end

  xit "renders a list of contacts" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Surname".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
