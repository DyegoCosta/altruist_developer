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
          expect(flash[:error]).to eql 'You can not alter this project'
        end

      end
    end
  end
end
