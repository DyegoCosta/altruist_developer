class Project < ActiveRecord::Base
  belongs_to :organization
  has_many :team_members, dependent: :destroy; private :team_members
  has_many :developers, through: :team_members

  validates_presence_of :title, :description
  validates :team_max_size, numericality: { only_integer: true, greater_than: 0 }

  def join_team(developer)
    developers << developer and save! unless team_full? || !team_leader
  end

  def set_leader(developer)
    TeamMember.create developer: developer, project: self, is_leader: true unless team_leader
  end

  def team_leader
    leader = team_members.leader.first
    leader ? leader.developer : nil
  end

  def leaded_by?(developer)
    team_leader == developer
  end

  def team_full?
    developers.size == team_max_size
  end
end
