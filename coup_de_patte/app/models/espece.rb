class Espece < ActiveRecord::Base
  has_many :animals
  validates_presence_of :nom
end
