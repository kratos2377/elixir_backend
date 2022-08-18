defmodule TodoWeb.UserController do
  use TodoWeb, :controller
  alias Todo.Repo
 import Plug.Conn

  alias Todo.Store.User

   @spec index(Plug.Conn.t(), any) :: Plug.Conn.t()
   def index(conn , _params) do

    conn
    |> put_resp_content_type("application /json")
    |> send_resp(201 , "something returned yes")
   end

def allUsers(conn , _params) do
  users = Repo.all(User)
  conn
  |> put_resp_content_type("application/json")
  |> send_resp(201 , users)
end

# def addUsers(conn , params) do

# end

end
