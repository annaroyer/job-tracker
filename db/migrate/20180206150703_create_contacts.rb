class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :full_name
      t.string :position
      t.string :email
      t.references :job, foreign_key: true

      t.timestamps
    end
  end
end
