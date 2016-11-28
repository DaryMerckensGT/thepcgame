class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.belongs_to :user, foreign_key: true
      t.string :image_file_name
      t.integer :image_file_size
      t.datetime :image_updated_at
      t.string :image_content_type

      t.timestamps
    end
  end
end
