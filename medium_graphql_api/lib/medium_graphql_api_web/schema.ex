defmodule MediumGraphqlApi.Schema do
    use Absinthe.Schema
    #import types
    import_types(MediumGraphqlApiWeb.Schema.Types)
    query do
        @desc "Get list of all users"
        field :users,  list_of(:user_type) do
        resolve(&Resolver.UserResolver.users/3)
        end
    end

    # mutation do
    # end

   # subscription do
  #  end
end