defmodule Fprints.GuardianSerializer do
    @behaviour Guardian.Serializer

    alias Fprints.Repo
    alias Fprints.User

    def for_token(user = %User{}), do: {:ok, "User:#{user.id}"}
    def for_token(_), do: {:error, "unkown resource type"}

    def from_token("User:" <> id), do: {:ok, Repo.get(User,id)}
    def from_token(_), do: {:error, "uknown reource type"}
    
end