defmodule MediumGraphqlApiWeb.Resolvers.SessionResolver do

    def login_user(_ , %{input: input}, _) do
        with {:ok, user <- Accounts.Session.authenticate(input)}, {:ok, jwt_token,_} <- _ do
            {:ok, %{token: jwt_token, user: user}}
        end
    end
end