class AddCoverImageToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :cover_image, :string
  end
end
