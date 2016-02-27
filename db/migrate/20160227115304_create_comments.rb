class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :concert
      t.string :name
      t.text :comment
      t.datetime :date
      t.timestamps null: false
    end
  end
end
