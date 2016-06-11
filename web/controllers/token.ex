defmodule Fprints.Token do
    use Fprints.Web, :controller
    
    def unauthenticated(conn, _params) do
        conn
        |> put_flash(:info, "you must be signed in to access this page")
        |> redirect(to: session_path(conn, :new))
    end

    def unauthorized(conn, _params) do
        conn
        |> put_flash(:error, "must be signed in to do that")
        |> redirect(to: session_path(conn, :new))
    end
end