class Tag < ApplicationRecord

has_and_belongs_to_many :websites

validates :title, presence: true

end
