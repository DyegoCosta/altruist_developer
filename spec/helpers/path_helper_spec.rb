require 'spec_helper'

describe PathHelper do
  describe '#destroy_session_path' do
    it 'returns destroy organization session path' do
      @request.env['devise.mapping'] = Devise.mappings[:organization]
      organization = create :organization
      sign_in organization

      helper.destroy_session_path.should == destroy_organization_session_path
    end
    
    it 'returns destroy developer session path' do
      @request.env['devise.mapping'] = Devise.mappings[:developer]
      developer = create :developer
      sign_in developer

      helper.destroy_session_path.should == destroy_developer_session_path
    end
  end
end
