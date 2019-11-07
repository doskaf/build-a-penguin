class CreatePenguins < ActiveRecord::Migration

  def change
    create_table :penguins do |t|
      t.string :name
      t.string :color
      t.string :headwear
      t.string :clothing
      t.integer :user_id
    end
  end

end
