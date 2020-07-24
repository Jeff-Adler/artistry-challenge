class Artist < ApplicationRecord
    has_many :artist_instruments, dependent: :destroy
    has_many :instruments, through: :artist_instruments
    accepts_nested_attributes_for :instruments
    # validates :name, presence: true
    # validates :title, uniqueness: true

    def instruments_attributes=(instrument_attributes)

        instrument_attributes.values.each do |instrument_attribute|
            instrument1 = Instrument.find_or_create_by(instrument_attribute)

            artist_instrument = ArtistInstrument.find_or_create_by(artist: self, instrument: instrument1)

        end

    end

end
