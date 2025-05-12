Sequel.migration do
  change do
    create_table :admins do
      primary_key :id
      String :username
      String :password
    end
  end
end
