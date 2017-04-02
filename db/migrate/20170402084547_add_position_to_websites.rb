class AddPositionToWebsites < ActiveRecord::Migration[5.0]
  def change
    add_column :websites, :position, :integer
  end
end
