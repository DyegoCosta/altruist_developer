class Project < ActiveRecord::Base
  attr_accessor :title, :description
  
  belongs_to :organization

  validates_presence_of :title, :description
end
