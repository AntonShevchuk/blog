class CreateParts < ActiveRecord::Migration[5.0]
  def change
    create_table :parts do |t|
      t.belongs_to :page, index: true
      t.belongs_to :tag, index: true
      t.timestamps
    end
  end
end
