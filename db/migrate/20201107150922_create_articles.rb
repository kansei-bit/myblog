class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title, null: false, default: ""
      t.text :content, null: false, limit: 4294967295
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
