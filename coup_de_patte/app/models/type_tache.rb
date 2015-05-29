class TypeTache < ActiveRecord::Base
  has_and_belongs_to_many :animals
  has_and_belongs_to_many :locations

  validates_presence_of :nom
end
