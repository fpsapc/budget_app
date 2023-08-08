class CreateEntities < ActiveRecord::Migration[7.0]
  def change
    create_table :entities do |t|
      t.string :name
      t.decimal :amount
      t.datetime :created_at
      t.integer :author_id
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
