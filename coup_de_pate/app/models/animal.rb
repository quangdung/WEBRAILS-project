class Animal < ActiveRecord::Base
  has_and_belongs_to_many :type_taches
  belongs_to :status_animal
  belongs_to :espece
  has_many :locations
end
