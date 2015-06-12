class Ferme < ActiveRecord::Base
  has_many :animals
  belongs_to :user
  validates_presence_of :nom
end
