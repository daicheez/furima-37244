class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :birth_day, presence: true
  validates :first_name, presence: true, format: {
                                          with: /\A[ぁ-んァ-ン一-龥]/,
                                          message: "全角で入力して下さい"
                                        }
  validates :last_name, presence: true, format: {
                                          with: /\A[ぁ-んァ-ン一-龥]/,
                                          message: "全角で入力して下さい"
                                        }
  validates :kana_first_name, presence: true, format: {
                                                with: /\A[ァ-ヶー－]+\z/,
                                                message: "全角カタカナで入力して下さい"
                                              }
  validates :kana_last_name, presence: true, format: {
                                              with: /\A[ァ-ヶー－]+\z/,
                                              message: "全角カタカナで入力して下さい"
                                            }
end
