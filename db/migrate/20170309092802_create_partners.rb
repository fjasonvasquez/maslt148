class CreatePartners < ActiveRecord::Migration[5.0]
  def change
    create_table :partners do |t|
      t.string :name
      t.references :website, foreign_key: true

      t.timestamps
    end
  end
end
