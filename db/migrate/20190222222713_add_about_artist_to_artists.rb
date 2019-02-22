class AddAboutArtistToArtists < ActiveRecord::Migration[5.2]
  def change
    add_column :artists, :about_artists, :text
  end
end
