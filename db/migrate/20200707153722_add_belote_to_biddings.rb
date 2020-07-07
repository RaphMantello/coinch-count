class AddBeloteToBiddings < ActiveRecord::Migration[6.0]
  def change
    add_column :biddings, :belote, :string
  end
end
