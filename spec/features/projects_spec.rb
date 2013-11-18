require 'spec_helper'

feature 'Project management' do
  given(:organization) { create :organization }

  background do
    organization_sign_in organization
  end

  scenario 'create new project', js: true do
    visit projects_path

    click_link 'new'

    project_name = 'Project X'
    within('#projectFormModal') do
      fill_in 'Title', with: project_name 
      fill_in 'project_description', with: 'Project X description'
      click_button 'Save project'
    end

     expect(page).to have_content 'Project successfully created'
     expect(page).to have_content project_name
  end
end
