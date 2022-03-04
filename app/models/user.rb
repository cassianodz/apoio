class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nome, presence: true
  validates :plantao, presence: true
  before_validation :normalize_nome, on: :create

  private

  def normalize_nome
    self.nome = nome.upcase
  end
end
