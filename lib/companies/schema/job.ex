defmodule Companies.Schema.Job do
  use Ecto.Schema
  import Ecto.Changeset

  alias Companies.Schema.{Company, PendingChange}

  schema "jobs" do
    field :title, :string
    field :url, :string
    field :remote, :boolean

    belongs_to :company, Company
    belongs_to :removed_pending_change, PendingChange

    timestamps()
  end

  @doc false
  def changeset(job, attrs) do
    job
    |> cast(attrs, [:title, :url, :company_id, :remote])
    |> validate_required([:title, :url, :company_id, :remote])
  end
end
