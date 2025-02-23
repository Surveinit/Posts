class CreateComments < ActiveRecord::Migration[7.2]
  def change
    create_table(:comments) do |t|
      t.text(:content)
      t.references(:user, null: false, foreign_key: true)
      t.references(:commentable, polymorphic: true, null: false)
      t.references(:parent, null: false, foreign_key: {to_table: :comments})

      t.timestamps
    end
  end
end
