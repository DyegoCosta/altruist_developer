require 'spec_helper'

feature 'Organization sign up' do
  scenario 'with valid informations' do
    name = 'Organization X'
    organization_sign_up_with(name: name, email: 'org@example.com', password: '123password', password_confirmation: '123password')

    expect(page).to have_content name
  end

  scenario 'with invalid informations' do
    organization_sign_up_with(name: 'Organization X', email: 'invalid_email', password: '123password', password_confirmation: '123password')

    expect(page).to have_content 'Sign up'
  end
end
