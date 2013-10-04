require 'spec_helper'

describe Project do
  it { should validate_presence_of :title }
  it { should validate_presence_of :description }
  it { should belong_to :organization }

  describe '#team_leader' do
    let(:project) { create :project }

    it 'obtain project team leader' do
      team_leader = create(:team_leader, project: project).developer
      project.team_leader.should == team_leader
    end

    it 'nil if there is no leader' do
      subject.team_leader.should be_nil
    end
  end

  describe '#set_leader' do
    it 'set a developer as a project leader' do
    end
  end
end
