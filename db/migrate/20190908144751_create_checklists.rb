class CreateChecklists < ActiveRecord::Migration[6.0]
  def change
    create_table :checklists do |t|
      t.string :title
      t.text :description
      t.string :status
      t.datetime :published_at
      t.belongs_to :user
      t.timestamps
    end
  end
end
