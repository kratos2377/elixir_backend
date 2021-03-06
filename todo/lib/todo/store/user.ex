defmodule Todo.Store.User do
  use Ecto.Schema
  import Ecto.Changeset



  @primary_key {:id , :binary_id , autogenerate: true}
  schema "users" do
    field :name, :string
    field :username, :string
    field :password, :string


  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name , :username , :password])
    |> validate_required([:name , :username , :password])
    |> unique_constraint(:username)
  end
end
