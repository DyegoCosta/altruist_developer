class TeamMember < ActiveRecord::Base
  belongs_to :project
  belongs_to :developer

  scope :leader, -> { where(is_leader: true) }
end
