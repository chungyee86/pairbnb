class User < ApplicationRecord
  include Clearance::User

  enum role: ["Customer", "Moderator", "Superadmin"]

  validates :email, uniqueness: true
  has_many :authentications, :dependent => :destroy
  has_many :listings, :dependent => :destroy
  has_many :listings, :dependent => :destroy

  mount_uploaders :avatars, AvatarsUploader

  def self.create_with_auth_and_hash(authentication, auth_hash)
    # byebug
      user = User.create!(first_name: auth_hash["extra"]["raw_info"]["name"].split(" ")[0], last_name: auth_hash["extra"]["raw_info"]["name"].split(" ")[1], email: auth_hash["extra"]["raw_info"]["email"])
      user.authentications << (authentication)
      return user
  end

  def fb_token
    x = self.authentications.where(:provider => :facebook).first
    return x.token unless x.nil?
  end

  # def password_optional?
  #   true
  # end

  # include Clearance::User

end
