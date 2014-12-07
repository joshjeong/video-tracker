class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :image
      t.string :release_date
      t.string :link
      t.boolean :watched

      t.timestamps
    end
  end
end
