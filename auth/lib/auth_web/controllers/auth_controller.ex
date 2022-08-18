defmodule AuthWeb.AuthController do
  use AuthWeb, :controller
  alias Auth.Accounts
  def ping(conn , _params) do
    conn
    |> render("ack.json" , %{success: true , message: "Pong"})
  end

  def register(conn , params) do
    params |> Accounts.create_user()
    conn |> render("ack.json" , %{success: true , message: "Registration Successful"})
  end
end
