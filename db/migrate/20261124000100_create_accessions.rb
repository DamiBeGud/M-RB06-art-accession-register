class CreateAccessions < ActiveRecord::Migration[8.1]
  def change
    create_table :accessions do |table|
      table.string :reference, null: false, limit: 48
      table.string :title, null: false, limit: 100
      table.integer :collection_year, null: false
      table.string :medium, null: false, limit: 12
    end
    add_index :accessions, :reference, unique: true
    add_index :accessions, [:medium, :collection_year]
    add_check_constraint :accessions, "collection_year BETWEEN 1500 AND 2100", name: "accessions_collection_year"
    add_check_constraint :accessions, "medium IN ('ceramic', 'paper', 'textile', 'wood')", name: "accessions_medium"
  end
end
