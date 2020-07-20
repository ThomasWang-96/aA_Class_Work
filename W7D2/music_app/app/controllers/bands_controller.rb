class BandsController < ApplicationController
    
    def index 
        @bands = Band.all
        render :index
    end

    def show
        @band = find_band
        if @band
            render :show
        else
            flash[:errors] = "can not find the band"
            redirect_to bands_url
        end
    end

    def find_band
        Band.find_by(id:params[:id])
    end
    
    def new
        @band = Band.new
        render :new
    end

    def create
        @band = Band.new(band_params)

        if @band.save
            redirect_to band_url(@band)
        else
            flash[:errors] = "can not create the band"
            render :new
        end
    end
    
  
    def edit
        @band = find_band
        render :edit
    end
    
  
    def update(band_params)
        @band = find_band
        if @band.update(band_params)
            render :show
        else
            flash[:errors] = "can not find the band"
            redirect_to bands_url
        end
    end
    
    def destory
        @band = find_band
        @band.destroy
        redirect_to bands_url
    end



    def band_params
        params.require(:band).permit(:name)
    end
end
