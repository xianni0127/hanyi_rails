class AddLoginToChild < ActiveRecord::Migration[5.1]
  def change
    add_column :children, :login, :string
  end
end
