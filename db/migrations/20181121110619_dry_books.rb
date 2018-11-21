Hanami::Model.migration do
  change do
    alter_table :books do
      drop_column :author
    end

    alter_table :books do
      set_column_not_null :author_id
    end
  end
end
