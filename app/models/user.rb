class User < ApplicationRecord
  has_many :items
  has_many :purchase_records
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :birth_day, presence: true
  validates :first_name, :last_name, presence: true, format: {
    with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  }
  validates :first_name_kana, :last_name_kana, presence: true, format: {
    with: /\A[ァ-ヶー－]+\z/
  }
  validates :password, format: {
    with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  }
end
