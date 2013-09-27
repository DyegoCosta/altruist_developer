class Developer < ActiveRecord::Base
  devise :omniauthable, :omniauth_providers => [:github]

  validates_presence_of :provider, :uid, :name, :email

  def self.from_github_auth_hash(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |developer|
      developer.uid = auth[:uid]
      developer.provider = auth[:provider]
      developer.name = auth[:info][:name]
      developer.email = auth[:info][:email]
    end
  end
end
