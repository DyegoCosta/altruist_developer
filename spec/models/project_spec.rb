require 'spec_helper'

describe Project do
  it { should validate_presence_of :title }
  it { should validate_presence_of :description }
  it { should belong_to :organization }

  let(:project) { create :project }

  describe '#team_leader' do
    it 'obtain project team leader' do
      team_leader = create(:team_leader, project: project).developer
      project.team_leader.should eql team_leader
    end

    it 'nil if there is no leader' do
      subject.team_leader.should be_nil
    end
  end

  describe '#set_leader' do
    it 'sets the project leader' do
      developer = create :developer 
      project.set_leader developer
      project.team_leader.should eql developer
    end

    it 'do not set if project is leaded' do
      create :team_leader, project: project
      project.set_leader(create :developer).should be_false
    end
  end
end
