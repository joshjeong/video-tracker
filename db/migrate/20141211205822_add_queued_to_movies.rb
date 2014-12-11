class AddQueuedToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :queued, :boolean
  end
end
