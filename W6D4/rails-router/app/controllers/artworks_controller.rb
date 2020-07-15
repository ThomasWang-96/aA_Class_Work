class ArtworksController < ApplicationController
    
    def index
        user = User.find_by_id(params[:user_id])
        artworks = (user.artworks + user.shared_artworks).uniq
        
        render json: artworks
    end

    def show
        artwork = Artwork.find_by_id(params[:id])
        render json: artwork
    end

    def create
       
        artwork = Artwork.new(artwork_params)

        if artwork.save
        render json: artwork, status: :created
        else
        render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
        
    end

    def update
        artwork = Artwork.find_by_id(params[:id])
        if artwork.update(artwork_params)
            render json: artwork
        else
            render json:artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        artwork = Artwork.find_by_id(params[:id])
        if artwork.destroy
            render json: artwork
        else
            render json:artwork.errors.full_messages, status: :unprocessable_entity
        end
    end


    private
    
    def artwork_params
        params.require(:artwork).permit(:artist_id, :image_url, :title)
    end
   

end
