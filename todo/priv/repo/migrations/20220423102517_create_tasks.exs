defmodule Todo.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    execute("CREATE EXTENSION IF NOT EXISTS \"uuid-ossp\";", "")
    create table(:task) do
      add :task_id , :uuid , primary_key: true, primary_key: true, default: fragment("uuid_generate_v4()")
      add :user_id, :uuid
      add :title, :string
      add :description, :string

      timestamps()
    end
  end
end
