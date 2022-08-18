defmodule AuthWeb.AuthView do
  use AuthWeb, :view

  def render("ack.json" , %{success: success , message: message}), do: %{success: success , message: message}
end
