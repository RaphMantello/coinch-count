class AddSuccessToBidding < ActiveRecord::Migration[6.0]
  def change
    add_column :biddings, :success, :boolean
  end
end
