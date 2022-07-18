class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_confirmation_of :password
  validates_presence_of :password, on: :create
  validates :nom, :prenom, :email, :date_naissance, :adresse, :code_postal,
            :ville, :telephone, presence: true
  validates :email, uniqueness: true
  validates :code_postal ,length: { maximum: 20}
  validates :telephone ,length: { maximum: 20}
  validates :password ,length: { maximum: 50}
  validates :statut, inclusion: { in: 1..3 }
  validates :genre, inclusion: { in: 0..1 }


  # --------------- A SAVOIR ! ---------------------------------------#
  # genre: [0: Homme, 1: Femme]
  # statut: [1: Actif; 2: Inactif; 3: Suspendu;]

end
