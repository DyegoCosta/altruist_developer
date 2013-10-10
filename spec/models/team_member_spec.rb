require 'spec_helper'

describe TeamMember do
  it { should belong_to :project }
  it { should belong_to :developer }

  describe '.leader' do
    it 'return leaders' do
      leader = create :team_leader
      member = create :team_member

      leaders = TeamMember.leader

      leaders.should include leader
      leaders.should_not include member
    end
  end
end
