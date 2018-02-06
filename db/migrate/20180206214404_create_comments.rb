class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :subject
      t.references :job, foreign_key: true

      t.timestamps
    end
  end
end
