class AddJobIdToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :references, :job
  end
end
