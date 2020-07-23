class CreateArtistInstruments < ActiveRecord::Migration[5.2]
  def change
    create_table :artist_instruments do |t|
      t.references :artist, foreign_key: true, null: false
      t.references :instrument, foreign_key: true, null: false

      t.timestamps
    end
  end
end
