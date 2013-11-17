module Features
  module SessionHelpers
    def organization_sign_up_with(args)
      visit new_organization_registration_path

      fill_in 'Name', with: args[:name]
      fill_in 'Email', with: args[:email]
      fill_in 'organization_password', with: args[:password]
      fill_in 'organization_password_confirmation', with: args[:password_confirmation]

      click_button 'Sign up'
    end

    def organization_sign_in(organization = nil)
      organization ||= create(:organization)

      visit new_organization_session_path

      fill_in 'Email', with: organization.email
      fill_in 'Password', with: organization.password

      click_button 'Sign in'
    end
  end
end
