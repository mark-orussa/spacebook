class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # Added confirmable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_one :galaxy
  has_many :friends
  has_many :notifications, foreign_key: :receiver_id
  has_many :notification_types, :through => :notifications#, source: :receiver_id
end
