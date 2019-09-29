defmodule TunesrankWeb.AuthController do
  use TunesrankWeb, :controller

  alias TunesrankWeb.Router.Helpers

  plug Ueberauth

  alias Ueberauth.Strategy.Helpers

  def logout(conn, _params) do
    conn
    |> put_flash(:info, "you Have Been Logged Out")
    |> configure_session(drop: true)
    |> redirect(to: "/")
  end

  def callback(%{assigns: %{ueberauth_failure: _fails}} = conn, _params) do
    conn
    |> put_flash(:error, "Failed To Authenticate")
    |> redirect(to: "/")
  end

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    case UserFromAuth.find_or_create(auth) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "successfully authenticated as " <> user.name <> ".")
        |> put_session(:current_user, user)
        |> redirect(to: "/") 
      {:error, reason} ->
        conn
        |> put_flash(:error, reason)
        |> redirect(to: "/")
    end
  end
end
