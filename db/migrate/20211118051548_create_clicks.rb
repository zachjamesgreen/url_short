class CreateClicks < ActiveRecord::Migration[7.0]
  def change
    create_table :clicks do |t|
      t.references :link, foreign_key: true
      t.string :ip
      t.string :user_agent
      t.datetime :date

      t.timestamps
    end
  end
end
