defmodule Ecto.Integration.Task do
  @moduledoc """
  - total time spent on tasks, per day
  """

  use Ecto.Schema
  import Ecto.Changeset


  schema "tasks" do
    field :name, :string
    field :start_time, Ecto.DateTime 
    field :end_time, Ecto.DateTime
    timestamps()
  end

  def changeset(schema, params) do
    cast(schema, params, ~w(name start_time end_time))
  end
end

defmodule EctoExploreTest do
  use ExUnit.Case

  alias Ecto.Integration.TestRepo
  alias Ecto.Integration.Task

  doctest EctoExplore

  setup do
      TestRepo.insert!(
        %Task{
         name: "Workout", 
         start_time: Ecto.DateTime.cast(~N[2017-01-07 10:30:00.0]),
         end_time: Ecto.DateTime.cast(~N[2017-01-07 10:30:00.0])
        })
  end

  test "the truth" do
    assert 1 + 1 == 2
  end
end

