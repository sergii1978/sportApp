Sequel.migration do
  change do
    create_table :images do
      primary_key :id
      String :path
    end
  end
end
