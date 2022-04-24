defmodule Todo.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    execute("CREATE EXTENSION IF NOT EXISTS \"uuid-ossp\";", "")
   create table(:users , primary_key: false) do
    add :id, :uuid , primary_key: true, default: fragment("uuid_generate_v4()")
    add :name, :string
    add :username, :string
    add :password, :string


   end
  end
end
