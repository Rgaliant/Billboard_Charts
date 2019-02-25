class AddYoutubeIdToArtists < ActiveRecord::Migration[5.2]
  def change
    add_column :artists, :youtube_id, :string
  end
end
