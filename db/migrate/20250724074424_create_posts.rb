class CreatePosts < ActiveRecord::Migration[8.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :summary
      t.text :body
      t.string :image_url
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
