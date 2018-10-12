class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :synopsis
      t.integer :rating
      t.string :author
    end
  end
end
