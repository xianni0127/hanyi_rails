class AddEmialToChild < ActiveRecord::Migration[5.1]
  def change
    add_column :children, :email, :string
  end
end
