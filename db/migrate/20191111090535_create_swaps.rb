class CreateSwaps < ActiveRecord::Migration[5.2]
  def change
    create_table :swaps do |t|
      t.references :listing_offered, foreign_key: { to_table: :listings }
      t.references :listing_requested, foreign_key: { to_table: :listings }
      t.string :status
      t.boolean :offered_recieved
      t.boolean :requested_recieved

      t.timestamps
    end
  end
end
