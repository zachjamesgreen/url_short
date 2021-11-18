class Click < ActiveRecord::Base
  belongs_to :link
  validates :date, :presence => true
end