Sequel.migration do
  change do
    create_table :comments do
      primary_key :id
      String :author
      String :body
    end
  end
end
