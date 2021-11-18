class User < ActiveRecord::Base
  has_secure_password
  has_many :links, dependent: :destroy
  has_many :clicks, :through => :links
  validates :email, :presence => true, :uniqueness => true, format: { with: /\A^[^@]+@[^@]+\.[^@]+$\z/, message: 'Invalid email' }
  validates :name, :presence => true
  before_create :downcase_email

  def downcase_email
    self.email.downcase! if self.email
  end
end