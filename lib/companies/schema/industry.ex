defmodule Companies.Schema.Industry do
  use Ecto.Schema
  import Ecto.Changeset

  alias Companies.Schema.{Company, PendingChange}

  schema "industries" do
    field :name, :string

    has_many :companies, Company
    belongs_to :removed_pending_change, PendingChange

    timestamps()
  end

  @doc false
  def changeset(industry, attrs) do
    industry
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
