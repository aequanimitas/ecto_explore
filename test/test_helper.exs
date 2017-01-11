ExUnit.start()

alias Ecto.Integration.TestRepo

Application.put_env(:ecto, TestRepo,
  adapter: Ecto.Adapters.Postgres,
  url: "ecto://localhost/ecto_explore_test",
  pool: Ecto.Adapters.SQL.Sandbox)

defmodule Ecto.Integration.TestRepo do
  use Ecto.Repo, otp_app: :ecto
end

{:ok, _} = Ecto.Adapters.Postgres.ensure_all_started(TestRepo, :temporary)

_ = Ecto.Adapters.Postgres.storage_down(TestRepo.config)

# create database "ecto_explore_test", throws error if db already exists
:ok = Ecto.Adapters.Postgres.storage_up(TestRepo.config)

{:ok, _pid} = TestRepo.start_link

# just do this here instead having another file
defmodule Ecto.Integration.Migration do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :name, :string
      add :start_time, :date
      add :end_time, :date
    end
  end
end

:ok = Ecto.Migrator.up(TestRepo, 0, Ecto.Integration.Migration, log: false)
Ecto.Adapters.SQL.Sandbox.mode(TestRepo, :manual)
Process.flag(:trap_exit, true)
