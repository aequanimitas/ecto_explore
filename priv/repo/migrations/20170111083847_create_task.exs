defmodule EctoExplore.Repo.Migrations.CreateTask do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :name, :string
      add :date_start, :date
      add :date_end, :date
      add :time_start, :datetime
      add :time_end, :datetime

      timestamps()
    end
  end
end
