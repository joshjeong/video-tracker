class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :title
      t.string :image
      t.string :release_date
      t.string :link
      t.boolean :watched, default: false

      t.timestamps
    end
  end
end
