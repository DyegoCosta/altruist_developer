require 'spec_helper'

describe ApplicationHelper do
  describe '#signed_in_user_email' do
    it 'returns organization email' do
      @request.env['devise.mapping'] = Devise.mappings[:organization]
      organization = create :organization
      sign_in organization

      helper.signed_in_user_email.should == organization.email
    end
    
    it 'returns developer email' do
      @request.env['devise.mapping'] = Devise.mappings[:developer]
      developer = create :developer
      sign_in developer

      helper.signed_in_user_email.should == developer.email
    end
  end
end
