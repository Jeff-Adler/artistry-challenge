class Instrument < ApplicationRecord
    has_many :artist_instruments, dependent: :destroy
    has_many :artists, through: :artist_instruments
end
