class AddPasswordDigestToChildren < ActiveRecord::Migration[5.1]
  def change
    add_column :children, :password_digest, :string
  end
end
