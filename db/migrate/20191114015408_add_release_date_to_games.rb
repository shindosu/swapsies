class AddReleaseDateToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :release_date, :date
  end
end
