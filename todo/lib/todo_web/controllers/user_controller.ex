defmodule TodoWeb.UserController do
  use TodoWeb, :controller
  alias Todo.Repo
 import Plug.Conn

  alias Todo.Store.User

   def index(conn , params) do

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(201 , "something returned")
   end

def allUsers(conn) do
  users = Repo.all(User)
  json(conn , users)
end

end
