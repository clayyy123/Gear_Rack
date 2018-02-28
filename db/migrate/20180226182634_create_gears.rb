class CreateGears < ActiveRecord::Migration[5.1]
  def change
    create_table :gears do |t|
      t.string :name
      t.string :brand
      t.integer :weight
      t.string :pricing
      t.string :personal_review
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
