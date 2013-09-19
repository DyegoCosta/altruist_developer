require 'spec_helper'

describe ProjectsController do
  describe 'sign in as organization' do
    before do
      @request.env['devise.mapping'] = Devise.mappings[:organization]
      sign_in create :organization
    end

    describe 'modifying not owned projects' do
      before do
        Project.stub(:find).and_return mock_model Project, organization: Organization.new
      end

      describe 'GET #edit' do
        it 'should redirect to the projects list' do
          get :edit, id: 'ID'
          expect(response).to redirect_to projects_path
        end
      end

      describe 'PUT #update' do
        it 'should redirect to the projects list' do
          put :update, id: 'ID' 
          expect(response).to redirect_to projects_path
        end
      end

      describe 'DELETE #destroy' do
        it 'should redirect to the projects list' do
          delete :destroy, id: 'ID'
          expect(response).to redirect_to projects_path
        end
      end
    end
  end
end
