class Animal < ActiveRecord::Base
  has_and_belongs_to_many :type_tache
  belongs_to :status_animal
  belongs_to :espece
  belongs_to :ferme
  has_many :locations
end
