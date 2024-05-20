class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.text :body, null: false
      t.belongs_to :user, null: false, foreign_key: { on_delete: :cascade }
      t.text :answer

      t.timestamps
    end
  end
end
