defmodule Todo.Repo.Migrations.CreateBook do
  use Ecto.Migration

  def change do
  create table(:books) do
    add :authors, {:array, :string}
    add :description, :string
    add :isbn, :string
    add :price, :float
    add :title, :string
  end
  end
end
