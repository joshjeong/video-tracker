class AddTrashedToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :trashed, :boolean
  end
end
