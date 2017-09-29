class RemovePasswordFromChildren < ActiveRecord::Migration[5.1]
  def change
    remove_column :children, :password, :string
  end
end
