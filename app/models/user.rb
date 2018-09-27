class User < ApplicationRecord
  acts_as_voter
  has_many :manuals
  has_many :steps
  has_many :comments, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable, :validatable, :omniauthable

  devise :omniauthable, :omniauth_providers => [:facebook, :vkontakte]

  validates :username, presence: :true, uniqueness: { case_sensitive: false }
  
  def self.from_omniauth(auth)
  	where(auth.slice(:provider, :uid)).first_or_create do |user|
  		user.provider = auth.provider
  		user.uid = auth.uid
  		user.username = auth.info.nickname
  	end
  end

end
