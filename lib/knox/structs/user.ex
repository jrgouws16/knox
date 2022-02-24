defmodule Knox.User do
  @moduledoc """
    Just a general user table that will facilitate everything to
    with someone logging into our application.
  """

  use Ecto.Schema

  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field(:name, :string)
    field(:surname, :string)
    field(:email, :string)

    timestamps()
  end

  def changeset(user, attrs \\ %{}) do
    user
    |> cast(attrs, [:name, :surname, :email])
    |> validate_required([:name, :surname, :email])
    |> unique_constraint([:email])
  end
end
