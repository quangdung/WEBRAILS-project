class Location < ActiveRecord::Base
  has_and_belongs_to_many :type_taches
  belongs_to :status_location
  belongs_to :animal
  belongs_to :paysan
end
