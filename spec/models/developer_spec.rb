require 'spec_helper'

describe Developer do
  it { should validate_presence_of :provider }
  it { should validate_presence_of :name }
  it { should validate_presence_of :uid }
  it { should validate_presence_of :email }

  describe '.from_github_auth_hash' do
    let(:developer_hash) { { provider: 'provider_test', uid: 'uid_test', info: { name: 'name test', email: 'test@example.com' } } }

    it 'creates developer' do
      expect {
        Developer.from_github_auth_hash developer_hash 
      }.to change { Developer.count }.from(0).to(1)
    end

    it 'returns created developer' do
      developer = create :developer, provider: developer_hash[:provider], uid: developer_hash[:uid]

      expect(Developer.from_github_auth_hash(developer_hash)).to eq(developer)
    end

    describe 'set developer info' do
      before do
        @developer = Developer.from_github_auth_hash developer_hash
      end

      it { @developer.provider.should == developer_hash[:provider] }
      it { @developer.uid.should == developer_hash[:uid] }
      it { @developer.name.should == developer_hash[:info][:name] } 
      it { @developer.email.should == developer_hash[:info][:email] }
    end
  end
end
