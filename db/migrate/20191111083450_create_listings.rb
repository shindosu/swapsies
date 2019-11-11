class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.references :user, foreign_key: true
      t.references :game, foreign_key: true
      t.string :condition
      t.string :status, default: 'available'

      t.timestamps
    end
  end
end
