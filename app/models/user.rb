class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  has_many :orders, dependent: :destroy
  has_many :user_favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates :first_name, :last_name, :address, :phone, :gender, presence: true
  validates :email, uniqueness: true
  validates :phone, format: { with: /(84|0[3|5|7|8|9])+([0-9]{8})\b/ }
  enum gender: [:male, :female, :orther]
  enum role: [:admin, :user]
  after_initialize :set_default_role, :if => :new_record?

  private
  def set_default_role
    self.role ||= :user
  end
end
