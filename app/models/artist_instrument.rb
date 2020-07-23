class ArtistInstrument < ApplicationRecord
  belongs_to :artist
  belongs_to :instrument

  validates_uniqueness_of :artist_id, scope: :instrument_id
  validates_uniqueness_of :instrument_id, scope: :artist_id

end
