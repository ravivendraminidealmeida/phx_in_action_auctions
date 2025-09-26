defmodule Auction.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field(:title, :string)
    field(:description, :string)
    field(:ends_at, :utc_datetime)
    timestamps()
  end

  def changeset(item, params \\ %{}) do
    item
    |> cast(params, [:title, :description, :ends_at])
    |> validate_required([:title, :description])
    |> validate_length(:title, min: 3)
    |> validate_length(:description, max: 200)
    |> validate_change(:ends_at, fn :ends_at, ends_at ->
      case DateTime.compare(ends_at, DateTime.utc_now()) do
        :lt -> [ends_at: "cannot be in the past"]
        _ -> []
      end
    end)
  end
end
