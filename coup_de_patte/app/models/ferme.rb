class Ferme < ActiveRecord::Base
  has_many :animals
  #belongs_to :gerant, :class_name => :user
  belongs_to :user
  validates_presence_of :nom
end
