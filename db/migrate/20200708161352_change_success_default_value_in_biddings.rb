class ChangeSuccessDefaultValueInBiddings < ActiveRecord::Migration[6.0]
  def change
    change_column :biddings, :success, :boolean, default: true
  end
end
