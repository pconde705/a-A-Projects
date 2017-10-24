class ArtworkSharesController < ApplicationController

  def create
    artwork = Artwork.find(params[:id])
    user = User.find(params[:id])
    ArtworkShare.find_by(artwork_id: 1, viewer_id: 2)
  end

  def destroy

  end

  private
  def artwork_shares_params
    params.require(:artwork_shares).permit(:artwork_id, :viewer_id)
  end

end
