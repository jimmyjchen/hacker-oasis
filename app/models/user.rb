class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :avatar, AvatarUploader
  has_many :projects
  has_many :collaborations
  has_many :comments
  has_many :notifications, foreign_key: :recipient_id

  validates :email, :username, uniqueness: true, presence: true
  # validates :avatar, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:github]

  # def self.from_omniauth(auth)
  #   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #     user.email = auth.info.email
  #     user.password = Devise.friendly_token[0, 20]
  #     user.username = auth.info.nickname
  #     user.social_avatar = auth.info.image
  #     # assuming the user model has a name
  #     # user.image = auth.info.image # assuming the user model has an image
  #     # If you are using confirmable and the provider(s) you use validate emails,
  #     # uncomment the line below to skip the confirmation emails.
  #     # user.skip_confirmation!
  #   end
  # end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.github_data"] && session["devise.github_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def profile_avatar_url
    social_avatar || avatar.url(:bright_face)
  end

  def self.from_omniauth(auth)
    puts auth
    user_params = auth.info.slice("email")
    user_params[:username] = auth.info.nickname
    user_params[:social_avatar] = auth.info.image
    user_params[:city] = auth.extra.raw_info.location
    user_params = user_params.to_h

    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20] # Fake password for validation
      user.save
    end

    return user
  end

  # def self.find_for_facebook_oauth(auth)
  #   user_params = auth.slice("provider", "uid")
  #   user_params.merge! auth.info.slice("email", "first_name", "last_name")
  #   user_params[:facebook_picture_url] = auth.info.image
  #   user_params[:token] = auth.credentials.token
  #   user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
  #   user_params = user_params.to_h

  #   user = User.find_by(provider: auth.provider, uid: auth.uid)
  #   user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
  #   if user
  #     user.update(user_params)
  #   else
  #     user = User.new(user_params)
  #     user.password = Devise.friendly_token[0,20]  # Fake password for validation
  #     user.save
  #   end

  #   return user
  # end
end
