class Gerant < User
  has_many :fermes
  has_many :animals
end