class AddRemeberDigestToChildren < ActiveRecord::Migration[5.1]
  def change
    add_column :children, :remeber_digest, :string
  end
end
