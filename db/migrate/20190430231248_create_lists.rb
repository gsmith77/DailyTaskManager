class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.string :title

      t.timestamps
      t.datetime :created_at
    end
  end
end
