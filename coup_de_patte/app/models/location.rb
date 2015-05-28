class Location < ActiveRecord::Base
  has_and_belongs_to_many :type_taches
  belongs_to :status_location
  belongs_to :animal
  #belongs_to :paysan, :class_name => :user
  belongs_to :user
  validates_presence_of :date
  validates_presence_of :dureeJour
  validates_presence_of :animal
  validates_presence_of :user
  validates_presence_of :status_location
end
