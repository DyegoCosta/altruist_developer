require 'spec_helper'

describe ProjectsController do
  context 'signed in as a organization' do
    before do
      @request.env['devise.mapping'] = Devise.mappings[:organization]
      sign_in create :organization
    end

    context 'not owned projects' do
      {
        edit: :get,
        update: :put,
        destroy: :delete
      }.each do |action, method|

        it 'action #{action} cannot be accessed' do
          send(method, action, id: create(:project, organization: Organization.new))

          expect(response).to redirect_to projects_path
          expect(flash[:alert]).to eql 'You can not alter this project'
        end
      end
    end
  end

  context 'signed in as a developer' do
    before do
      @request.env['devise.mapping'] = Devise.mappings[:developer]
      sign_in create :developer
    end

    describe 'create project repository' do
      it 'returns repository url' do
        repository_url = 'github.com/altruist_developer/test_repository'
        ProjectSourceCode.stub(:start_repository).and_return repository_url
        Project.stub(:find)

        post :start_repository, repository_name: 'test_repository'

        expect(response.status).to eql 201
        expect(response.location).to eql repository_url
      end
    end
  end
end
