class ArtistInstrumentsController < ApplicationController

    def new
        @artistinstrument = ArtistInstrument.new
        @artists = Artist.all
        @instruments = Instrument.all
    end

    def create 

        @artistinstrument = ArtistInstrument.create(artist_instrument_params)

        if @artistinstrument.valid?
            redirect_to artist_path(@artistinstrument.artist.id)
        else
            redirect_to new_artist_instrument_path, form_errors: @artistinstrument.errors.full_messages
        end
    end

    def destroy
        @artistinstrument = ArtistInstrument.find(params[:id])
        @artistinstrument.destroy
        redirect_to artists_path
    end

    private

    def artist_instrument_params
        params.require(:artist_instrument).permit(:artist_id,:instrument_id)
    end
end
