class BandsController < ApplicationController
    
    def index 
        @bands = Band.all
        render :index
    end

    def show
        @band = Band.find_by(id:params[:id])
        if @band
            render :show
        else
            flash[:error] = "can not find the band"
            redirect_to bands_url
        end
    end
    
    def new
    end

    def create
        @band =  Band.new(band_params)

        if @band.save
            redirect_to band_url(@band)
        else
            flash[:error] = "can not create the band"
            render :new
        end
    end
    
  
    def edit
    end
    
  
    def update(band_params)
        @band = Band.find_by(id:params[:id])
        if @band.update(band_params)
            render :show
        else
            flash[:error] = "can not find the band"
            redirect_to bands_url
        end
    end
    
    def destory
        @band = Band.find_by(id:params[:id])

        if @band.delete
            redirect_to bands_url
        else
            flash.now[:error] = "can not find the band"
            render :index
        end
            
    end



    def band_params
        params.require(:band).permit(:name)
    end
end
