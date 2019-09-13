class CreateTables < ActiveRecord::Migration[6.0]
  def change
    create_table :forms do |t|
      t.string :title
      t.text :description
      t.string :status
      t.datetime :published_at
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end

    create_table :questions do |t|
      t.string :question_text
      t.text :question_description
      t.references :form, null: false, foreign_key: true

      t.timestamps
    end

    create_table :checklists do |t|
      t.string :project_id
      t.references :user, null: false, foreign_key: true
      t.references :form, null: false, foreign_key: true
      t.timestamps
    end

    create_table :answers do |t|
      t.string :choice
      t.text :comment
      t.references :checklist, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
