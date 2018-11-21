Hanami::Model.migration do
  change do
    create_table :comments do
      primary_key :id

      foreign_key :user_id,  :users,   null: false, on_delete: :cascade
      foreign_key :story_id, :stories, null: false, on_delete: :cascade

      column :text, String, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
