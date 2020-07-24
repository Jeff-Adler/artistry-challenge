class Instrument < ApplicationRecord
    has_many :artist_instruments, dependent: :destroy
    has_many :artists, through: :artist_instruments
    accepts_nested_attributes_for :artists
    # validates :name, presence: true
    # validates :classification, presence: true
    # validates :name, uniqueness: true

    @@classifications = ['woodwind','brass','percussion','string','keyboard','electronic']

    def self.classifications 
        @@classifications
    end

    def artists_attributes=(artist_attributes)
        
        artist_attributes.values.each do |artist_attribute|
            artist1 = Artist.find_or_create_by(artist_attribute)
            
            artist_instrument = ArtistInstrument.find_or_create_by(artist: artist1, instrument: self)
        end

    end
end
