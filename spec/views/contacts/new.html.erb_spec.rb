require 'rails_helper'

RSpec.describe "contacts/new", type: :view do
  before(:each) do
    assign(:contact, Contact.new(
      :first_name => "MyString",
      :surname => "MyString",
      :company => nil
    ))
  end

  xit "renders new contact form" do
    render

    assert_select "form[action=?][method=?]", contacts_path, "post" do

      assert_select "input#contact_first_name[name=?]", "contact[first_name]"

      assert_select "input#contact_surname[name=?]", "contact[surname]"

      assert_select "input#contact_company_id[name=?]", "contact[company_id]"
    end
  end
end
