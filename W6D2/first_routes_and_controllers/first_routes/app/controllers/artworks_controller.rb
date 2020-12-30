class ArtworksController < ApplicationController

  def index
    # render json: Artwork.all
    
    if params[:user_id]
      artwork = Artwork
        .left_outer_joins(:shares)
        .where('(artworks.artist_id = :user_id) OR (artwork_shares.viewer_id = :user_id)', user_id: params[:user_id])
        .distinct
    else
      artwork = Artwork.all
    end
    
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