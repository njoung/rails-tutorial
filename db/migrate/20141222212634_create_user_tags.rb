class CreateUserTags < ActiveRecord::Migration
  def change
    create_table :user_tags do |t|
      t.references :user, index: true
      t.references :micropost, index: true

      t.timestamps null: false
    end
    # add_index :user_tags, [:tagged_user, :micropost], unique: true
  end
end
