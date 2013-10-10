class Project < ActiveRecord::Base
  belongs_to :organization
  has_many :team_members, dependent: :destroy; private :team_members
  has_many :developers, through: :team_member

  validates_presence_of :title, :description

  def team_leader
    leader = team_members.leader.first
    leader ? leader.developer : nil
  end
end
