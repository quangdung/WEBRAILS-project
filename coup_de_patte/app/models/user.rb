class User < ActiveRecord::Base
  has_and_belongs_to_many :roles

  has_many :animals
  has_many :fermes

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def has_role?(role)
    # faire attention à la case, tous les modifications de case invalide la vérification de rôle
    # return self.roles.find_by(:name => role.to_s.upcase)

    return self.roles.find_by(:name => role.to_s)
  end

  def roles_as_text
    texte = ''
    self.roles.each do |role|
      texte = texte + role.name + ' '
    end

    return texte[0...-1] # enlever le dernier charactère
  end
end
