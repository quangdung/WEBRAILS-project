class Ferme < ActiveRecord::Base
  has_many :animals
  belongs_to :gerant
end
