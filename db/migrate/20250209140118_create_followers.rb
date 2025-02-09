class CreateFollowers < ActiveRecord::Migration[7.2]
  def change
    create_table :followers do |t|
      t.timestamps
    end
  end
end
