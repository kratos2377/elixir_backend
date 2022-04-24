defmodule Todo.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    execute("CREATE EXTENSION IF NOT EXISTS \"uuid-ossp\";", "")
    create table(:task , primary_key: false) do
      add :id , :uuid ,  primary_key: true, default: fragment("uuid_generate_v4()")
      add :title, :string
      add :description, :string





    end
  end
end
