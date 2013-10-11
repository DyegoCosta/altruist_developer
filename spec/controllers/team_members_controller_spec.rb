require 'spec_helper'

describe TeamMembersController do
  context 'signed in as a developer' do
    before do
      @request.env['devise.mapping'] = Devise.mappings[:developer]
      sign_in create :developer
    end

    describe 'POST #leader' do
      it 'cannot set leader if project is already leaded' do
        project = create :project
        create :team_leader, project: project

        post :create, project_id: project.id, developer: double('developer')

        expect(response.status).to eql 412 #precondition_failed
      end
    end
  end
end
