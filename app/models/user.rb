class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :birth_day, presence: true
  validates :first_name, :last_name, presence: true, format: {
    with: /\A[ぁ-んァ-ン一-龥]/,
    message: '全角で入力して下さい'
  }

  validates :first_name_kana, :last_name_kana, presence: true, format: {
    with: /\A[ァ-ヶー－]+\z/,
    message: '全角カタカナで入力して下さい'
  }

  validates :encrypted_password, presence: true, format: {
    with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/,
    message: 'アルファベットと数字を含めて下さい'
  }
end
