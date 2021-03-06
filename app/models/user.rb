class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  enum role: [
    :admin,
    :user
  ]
  after_initialize :set_default_role, :if => :new_record?
  validates :email, :uniqueness => true

  def set_default_role
    self.role ||= :user
  end
end
