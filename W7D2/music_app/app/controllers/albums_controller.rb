class AlbumsController < ApplicationController

    def new
        @album = Album.new
        render :new
    end

    def find_album
        Album.find_by(id: params[:id])
    end

    def create
        @album = Album.new(album_params)
        
        if @album.save
            redirect_to album_url(@album)
        else
            flash.now[:errors] = 'Can not save new album, try again'
            redirect_to new_band_album_url
        end
    end
    
    def edit
        @album = find_album
        render :edit
    end

    def show
        @album = find_album
        render :show
    end

    def update
        @album = find_album
        
        if @album.update_attributes(album_params)
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

    private

    def album_params
        params.require(:album).permit(:title, :year, :live, :band_id)    
    end

end
