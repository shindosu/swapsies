class CreateSwaps < ActiveRecord::Migration[5.2]
  def change
    create_table :swaps do |t|
      t.references :listing_offered, foreign_key: { to_table: :listings }
      t.references :listing_requested, foreign_key: { to_table: :listings }
      t.string :status, default: 'pending'
      t.boolean :offered_recieved, default: false
      t.boolean :requested_recieved, default: false

      t.timestamps
    end
  end
end
