ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Fprints.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Fprints.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Fprints.Repo)

