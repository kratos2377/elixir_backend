defmodule MediumGraphqlApi.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :password_hash, :string
    field :password, :string ,virtual: true
    field :password_confirmation, :string , virtual:  true
    field :role, :string, default: "user"

    timestamps()
  end

  @spec changeset(
          {map, map}
          | %{
              :__struct__ => atom | %{:__changeset__ => map, optional(any) => any},
              optional(atom) => any
            },
          :invalid | %{optional(:__struct__) => none, optional(atom | binary) => any}
        ) :: Ecto.Changeset.t()
  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:first_name, :last_name, :email, :password , :password_confirmation, :role])
    |> validate_required([:first_name, :last_name, :email, :password , :password_confirmation, :role])
    |> validate_format(:email, ~r/@/)
    |> update_change(:email , &String.downcase(&1))
    |> validate_length(:password, min: 6 , max: 30)
    |> validate_confirmation(:password)
    |> unique_constraint(:email)
    |> hash_password
  end

  defp hash_password(changeset) do
    case changeset do
       %Ecto.Changeset{valid?: true, changes: %{password: password}} -> put_change(changeset, :password_hash, Pbkdf2.hash_pwd_salt(password))
      _ -> changeset
    end
  end
end
