class Link < ActiveRecord::Base
  validates :url, :presence => true
  validates :slug, :presence => true # scope uniqueness: true to user
  has_many :clicks, dependent: :destroy
  belongs_to :user

end