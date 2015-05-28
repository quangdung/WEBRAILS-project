class Animal < ActiveRecord::Base
  has_and_belongs_to_many :type_tache
  belongs_to :status_animal
  belongs_to :espece
  belongs_to :ferme
  belongs_to :user
  has_many :locations
  validates_presence_of :nom
  validates_presence_of :status_animal
  validates_presence_of :prix_journalier
  validates_presence_of :user
  validates_presence_of :espece
end
