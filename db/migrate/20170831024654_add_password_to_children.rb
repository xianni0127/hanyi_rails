class AddPasswordToChildren < ActiveRecord::Migration[5.1]
  def change
    add_column :children, :password, :string
  end
end
