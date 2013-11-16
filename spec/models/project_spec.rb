require 'spec_helper'

describe Project do
  it { should validate_presence_of :title }
  it { should validate_presence_of :description }
  it { should validate_numericality_of(:team_max_size).only_integer.is_greater_than(0) }
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

  describe '#join_team' do
    let(:developer) { create :developer }

    context 'project has a leader' do
      before do
        project.set_leader create :developer
      end

      it 'add a developer to the project team' do
        project.join_team developer
        project.reload
        project.developers.should include developer
      end

      it 'should not add the member as a leader' do
        project.join_team developer
        project.team_leader.should_not eql developer
      end
    end

    describe 'do not add to the project team' do
      it 'when team max size was reached' do
        Project.any_instance.stub(:team_full? => true)
        project.join_team developer
        project.developers.should_not include developer
      end
    
      it 'when team has no leader' do
        project.team_leader.should be_nil
        project.join_team developer
        project.developers.should_not include developer
      end
    end
  end

  describe '#leaded_by?' do
    let(:team_leader) { create(:team_leader, project: project).developer }

    it { project.leaded_by?(team_leader).should be_true }
    
    it { project.leaded_by?(Developer.new).should be_false }
  end

  describe '#team_full?' do
    it 'true if team max size reached' do
      project = create :project, team_max_size: 10
      project.developers.stub(:size).and_return 10
      project.team_full?.should be_true
    end
  end

  describe '#owned_by?' do
    let(:organization) { build_stubbed(:organization) }
    let(:project) { build_stubbed(:project, organization: organization) }

    it { project.owned_by?(organization).should be_true }

    it { project.owned_by?(Organization.new).should be_false }
  end
end
