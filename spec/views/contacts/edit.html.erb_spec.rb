require 'rails_helper'

RSpec.describe "contacts/edit", type: :view do
  before(:each) do
    @contact = assign(:contact, Contact.create!(
      :first_name => "MyString",
      :surname => "MyString",
      :company => nil
    ))
  end

  xit "renders the edit contact form" do
    render

    assert_select "form[action=?][method=?]", contact_path(@contact), "post" do

      assert_select "input#contact_first_name[name=?]", "contact[first_name]"

      assert_select "input#contact_surname[name=?]", "contact[surname]"

      assert_select "input#contact_company_id[name=?]", "contact[company_id]"
    end
  end
end
