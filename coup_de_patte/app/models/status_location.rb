class StatusLocation < ActiveRecord::Base
  has_many :locations
  validates_presence_of :nom
end
