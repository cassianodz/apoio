class AddPlantaoToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :plantao, :string
  end
end
