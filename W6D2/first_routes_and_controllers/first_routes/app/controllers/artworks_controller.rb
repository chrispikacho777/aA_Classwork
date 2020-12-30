class ArtworksController < ApplicationController

    def index
        artwork = Artwork.where('artist_id = params[:user_id] OR ')
        render json: artwork
    end

    def create
      artwork = Artwork.new(artwork_params)
      
      if artwork.save
        render json: artwork
      else
        render json: artwork.errors.full_messages, status: :unprocessable_entity
      end
    end

    def show
        artwork = params[:id]

        render json: Artwork.find(artwork)
    end

    def update
        artwork = Artwork.find(params[:id])

        artwork.update(artwork_params)

        render json: artwork
    end

    def destroy
        artwork = Artwork.find(params[:id])
        artwork.destroy 

        render json: artwork
    end

    private
    def artwork_params
        params.require(:artwork).permit(:artist_id, :title, :image_url)
    end

end