class Project < ActiveRecord::Base
  belongs_to :organization
  has_many :developers, through: :teams

  validates_presence_of :title, :description
end
