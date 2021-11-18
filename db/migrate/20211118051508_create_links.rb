class CreateLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :links do |t|
      t.string :url
      t.string :slug
      t.references :user, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
