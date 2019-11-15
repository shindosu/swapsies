class CreateWishlistItems < ActiveRecord::Migration[5.2]
  def change
    create_table :wishlist_items do |t|
      t.user :references
      t.game :references

      t.timestamps
    end
  end
end
