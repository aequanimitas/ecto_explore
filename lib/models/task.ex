defmodule EctoExplore.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :name, :string
    field :date_start, Ecto.Date
    field :date_end, Ecto.Date
    field :time_start, Ecto.DateTime
    field :time_end, Ecto.DateTime

    belongs_to :user, Prizex.User
    timestamps()
  end

  @required_fields ~w(user_id)

  @doc """
  Builds a changeset based on the `struct` and `params`.

  Call this on REPL before doing an insert to properly cast datetime fields
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :date_start, :date_end, :time_start, :time_end], @required_fields)
    |> validate_required([:name, :date_start, :date_end, :time_start, :time_end])
  end
end
