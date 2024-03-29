defmodule MediumGraphqlApiWeb.Schema do
    use Absinthe.Schema
    alias MediumGraphqlApiWeb.Resolvers
    #import types
    import_types(MediumGraphqlApiWeb.Schema.Types)
    query do
        @desc "Get list of all users"
        field :users,  list_of(:user_type) do
        resolve(&Resolvers.UserResolver.users/3)
        end
    end

    mutation do
        @desc "Register a new user"
        field :register_user, type: :user_type do
        arg(:input , non_null(:user_input_type))
        resolve(&Resolvers.UserResolver.register_user/3)
        end

        @desc "Login user and return JWT token"
        field :login_user, type: :session_type do
        arg(:input , non_null(:session_input_type))
        resolve(&Resolvers.SessionResolver.login_user/3)
        end
    end

   # subscription do
  #  end
end