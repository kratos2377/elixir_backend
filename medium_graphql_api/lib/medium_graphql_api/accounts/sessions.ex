defmodule MediumGraphqlApi.Accounts.Session do
    alias MediumGraphqlApi.Accounts.User
    alias MediumGraphqlApi.Repo
    def authenticate(arg) do
       user = Repo.get_by(User, email: String.downcase(args.email))

       case check_password(user , args) do
        true -> {:ok, user}
        _ -> {:error, "Incorrect Login Credentials"}
       end
    end

    defp check_password(user, args) do
        case user do
            nil -> false
            _ -> Pbkdf2.check_pass(user.password_hash, args.password)
        end
    end
end