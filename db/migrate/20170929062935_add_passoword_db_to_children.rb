class AddPassowordDbToChildren < ActiveRecord::Migration[5.1]
  def change
    add_column :children, :password_db, :string
  end
end
