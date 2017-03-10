json.extract! contact, :id, :first_name, :surname, :company_id, :created_at, :updated_at
json.url contact_url(contact, format: :json)
