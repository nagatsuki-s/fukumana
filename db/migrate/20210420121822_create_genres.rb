class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.integer :category, default: 0

      t.timestamps
    end
  end
end
