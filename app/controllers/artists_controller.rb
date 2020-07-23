class ArtistsController < ApplicationController
    before_action :set_artist, only: [:edit,:destroy,:update, :show]

    def index 
        @artists = Artist.all 
    end

    def new 
        @artist = Artist.new 
    end

    def create 
        @artist = Artist.create(artist_params)

        if @artist.valid?
            redirect_to artist_path(@artist)
        else
            redirect_to new_artist_path, form_errors: @artist.errors.full_messages
        end
    end

    def show 
        @instruments = @artist.instruments
    end

    def edit 
    end

    def update 

        if @artist.update(artist_params)
            redirect_to artist_path(@artist)
        else
            redirect_to edit_artist_path(@artist), form_errors: @artist.errors.full_messages
        end
    end

    def destroy 
        @artist.destroy
        redirect_to artists_path
    end

    private

    def set_artist 
        @artist = Artist.find(params[:id])
    end

    def artist_params 
        params.require(:artist).permit(:name, :age, :title, instruments_attributes: [:name,:classification])
    end
end

