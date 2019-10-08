class User < ActiveRecord::Base
  validates :email, presence:true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :reviews

  has_one_attached :avatar
  #ユーザーのレコードと画像を紐づけることができる。
  #ユーザーテーブルにカラムを追加する必要がなくなる。
end
