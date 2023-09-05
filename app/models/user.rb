class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :omniauthable, omniauth_providers: [:google]

  attr_accessor :skip_validation

  has_many :orders, dependent: :destroy
  has_many :user_favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :first_name, :last_name, :address, :phone, :gender, presence: true, unless: :validation?
  validates :email, uniqueness: true
  validates :phone, format: { with: /(84|0[3|5|7|8|9])+([0-9]{8})\b/ }, unless: :validation?
  enum gender: { male: 0, female: 1, orther: 2 }
  enum role: { admin: 0, user: 1 }
  after_initialize :set_default_role, if: :new_record?

  def self.from_omniauth(auth)
    find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name # assuming the user model has a name
      # user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      user.skip_confirmation!
    end
  end

  private

  def set_default_role
    self.role ||= :user
  end

  def validation?
    @skip_validation
  end
end
