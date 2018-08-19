class User < ApplicationRecord
  has_one :profile
  has_many :articles
  mount_uploader :profileimage, S3Uploader
  acts_as_follower
  acts_as_followable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
