class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :omniauthable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, omniauth_providers: [:google_oauth2]
        
  attr_accessor :current_password

  has_one_attached :avatar

  def avatar_thumbnail
    if avatar.attached?
      avatar.variant(resize: "150x150!").processed
    else
      "/assets/default_profile.jpg"
    end  
  end
  
  has_many :messages, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :researches, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship",
                                foreign_key: "follower_id",
                                dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed    
  has_many :passive_relationships, class_name: "Relationship",
                                 foreign_key: "followed_id",
                                 dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.full_name = auth.info.name # assuming the user model has a name
      user.avatar_url = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end
  
  def admin?
    role == 1  # Supponiamo che tu abbia un campo 'role' nel tuo modello User
  end

  def moderator?
    role == 2  # Supponiamo che tu abbia un campo 'role' nel tuo modello User
  end

  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end


  # Unfollows a user.
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end
end
