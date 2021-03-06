require 'rspotify'


class ArtistsController < ApplicationController
  before_action :set_billboard, except: :view_artists
  before_action :set_artist, only: [:show, :update, :edit, :destroy]
  
  def index
    @artists = @billboard.artists.new
  end

  def show
  end

  def view_artists
    @artist_view = Artist.all  
  end

  def new
    @artist = @billboard.artists.new
    render partial: "artists/form"
  end

  def edit
    render partial: "artists/form"
  end

  def create
    @artist = @billboard.artists.new(artist_params)
    if @artist.save
      redirect_to billboard_artists_path
    else
      render :new
    end
  end

  def update
    if @artist.update(artist_params)
      redirect_to [@billboard, @artist]
    else
      render :edit
    end
  end

  def destroy
    @artist.destroy
    redirect_to [@billboard, @artist]
  end











  private

  def set_billboard
    # binding.pry
    @billboard = Billboard.find(params[:billboard_id])
  end

  def set_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name, :genre, :avatar, :spot_on_charts, :weeks_on_charts, :about_artists, :youtube_id)
  end


end

