class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.string :title
      t.text :content
      t.references :user
      t.references :category
      t.timestamps
    end
  end
end
