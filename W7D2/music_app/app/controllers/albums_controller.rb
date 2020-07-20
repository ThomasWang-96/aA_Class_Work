class AlbumsController < ApplicationController

    def index 
        @albums = Album.where(band_id: params[:band_id])
        render :index
    end

    def new
        
    end


    def create
        @album = Album.new(album_params)
        
        if @album.save
            redirect_to album_url(@album)
        else
            flash.now[:errors] = 'Can not save new album, try again'
            render :new
        end
    end
    
    def edit
    end

    def show
        @album = Album.find_by(id: params[:id])
        render :show
    end

    def update
        @album = Album.find_by(id:params[:id])
        
        if @album.update(album_params)
            redirect_to album_url(@album)
        else
            flash.now[:errors] = 'fail to edit'
            render :edit
        end
          
    end

    def destory
        @album = Album.find_by(id:params[:id])
        @album.destroy
        redirect_to :index
        end
    end

    private

    def album_params
        params.require(:album).permit(:title, :year, :live, :band_id)    
    end

end
