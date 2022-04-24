defmodule Todo.Store.Task do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id , :binary_id , autogenerate: true}
  schema "task" do
    field :user_id, :binary_id
    field :title, :string
    field :description, :string


  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:user_id , :title , :description])
    |> validate_required([:user_id , :title , :description])
  end
end
