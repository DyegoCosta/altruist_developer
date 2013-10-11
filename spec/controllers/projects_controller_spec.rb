require 'spec_helper'

describe ProjectsController do
  describe 'sign in as organization' do
    before do
      @request.env['devise.mapping'] = Devise.mappings[:organization]
      sign_in create :organization
    end

    context 'modifying not owned projects' do
      {
        edit: :get,
        update: :put,
        destroy: :delete
      }.each do |action, method|

        it 'can not access the #{action} action' do
          send(method, action, id: create(:project, organization: Organization.new))

          expect(response).to redirect_to projects_path
          expect(flash[:error]).to eql('You can not alter this project')
        end
      end
    end
  end
end
