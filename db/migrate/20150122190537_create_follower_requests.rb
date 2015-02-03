class CreateFollowerRequests < ActiveRecord::Migration
  def change
    create_table :follower_requests do |t|
      t.references :followed, index: true
      t.references :follower, index: true

      t.timestamps null: false
    end
    add_foreign_key :follower_requests, :followeds
    add_foreign_key :follower_requests, :followers
  end
end
