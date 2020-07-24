class InstrumentsController < ApplicationController
    before_action :set_instrument, only: [:edit,:destroy,:update, :show]

    def index 
        @instruments = Instrument.all 
    end

    def new 
        @instrument = Instrument.new 
    end

    def create 
        @instrument = Instrument.create(instrument_params)

        if @instrument.valid?
            #if new artist is created, send them to flash with artists params
                #if artists is not new, take them to instrument path
            redirect_to instrument_path(@instrument)
                #if artist is new, render the same page with those attributes
        else
            redirect_to new_instrument_path, form_errors: @instrument.errors.full_messages
        end
    end

    def show 
        @artists = @instrument.artists
    end

    def edit 
    end

    def update 

        if @instrument.update(instrument_params)
            redirect_to instrument_path(@instrument)
        else
            redirect_to edit_instrument_path(@instrument), form_errors: @instrument.errors.full_messages
        end
    end

    def destroy 
        @instrument.destroy
        redirect_to instruments_path
    end

    private

    def set_instrument 
        @instrument = Instrument.find(params[:id])
    end

    def instrument_params 
       # params.require(:instrument).permit(:name, :classification, :artists_attributes[:name, :age, :title])
        
       params.require(:instrument).permit(:name, :classification, artists_attributes: [:name])
    end
end
