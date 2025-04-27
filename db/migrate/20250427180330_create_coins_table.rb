class CreateCoinsTable < ActiveRecord::Migration[8.0]
  def change
    create_table :coins do |t|
      t.string :name
      t.string :description
      t.string :image_url
      
      t.string :website_url
      t.string :twitter_url
      t.string :telegram_url
      t.string :instagram_url
      t.string :facebook_url
      
      t.boolean :approved
      t.boolean :our_coin
      t.boolean :paid_for

      t.integer :approved_by
      t.integer :listed_by

      t.timestamps
    end
  end
end
