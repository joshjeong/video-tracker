class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :image
      t.string :release_date
      t.string :link
      t.string :rating
      t.text :overview
      t.boolean :watched, default: false
      t.boolean :queued, default: false
      t.boolean :trashed, default: false

      t.timestamps
    end
  end
end
