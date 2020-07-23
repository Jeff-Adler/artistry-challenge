class Artist < ApplicationRecord
    has_many :artist_instruments, dependent: :destroy
    has_many :instruments, through: :artist_instruments
    accepts_nested_attributes_for :instruments
    validates :name, presence: true
    validates :title, uniqueness: true
end
