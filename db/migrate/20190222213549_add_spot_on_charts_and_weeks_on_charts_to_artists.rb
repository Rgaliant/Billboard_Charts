class AddSpotOnChartsAndWeeksOnChartsToArtists < ActiveRecord::Migration[5.2]
  def change
    add_column :artists, :spot_on_charts, :integer
    add_column :artists, :weeks_on_charts, :integer
  end
end
