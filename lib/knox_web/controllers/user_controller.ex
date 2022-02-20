defmodule KnoxWeb.UserController do
  use KnoxWeb, :controller

  alias Knox.{User, Repo}

  def create(conn, %{"user" => user} = _params) do
    changeset = %User{} |> User.changeset(user)

    case Repo.insert(changeset) do
      {:ok, _user} ->
        conn
        |> put_flash(:info, "User created successfully")
        |> redirect(to: Routes.user_path(conn, :index))

      {:error, err_changeset} ->
        conn
        |> put_flash(:error, "Error creating user")

        render(conn, "new.html", changeset: err_changeset)
    end
  end

  def index(conn, _params) do
    users = Repo.all(User)
    render(conn, "index.html", users: users)
  end

  def new(conn, _params) do
    changeset = User.changeset(%User{}, %{})

    render(conn, "new.html", changeset: changeset)
  end

  def edit(conn, %{"id" => user_id} = _params) do
    user = Repo.get(User, user_id)
    changeset = User.changeset(user)

    render(conn, "edit.html", changeset: changeset, user: user)
  end

  def update(conn, %{"id" => user_id, "user" => user} = _params) do
    old_user = Repo.get(User, user_id)
    changeset = User.changeset(old_user, user)

    case Repo.update(changeset) do
      {:ok, _user} ->
        conn
        |> put_flash(:info, "User updated successfully")
        |> redirect(to: Routes.user_path(conn, :index))

      {:error, err_changeset} ->
        render(conn, "edit.html", changeset: err_changeset, user: old_user)
    end
  end

  def delete(conn, %{"id" => user_id} = _params) do
    case Repo.get(User, user_id) do
      nil ->
        conn
        |> put_flash(:info, "User not found.")
        |> redirect(to: Routes.user_path(conn, :index))

      %User{} = user ->
        Repo.delete!(user)

        conn
        |> put_flash(:info, "User deleted successfully")
        |> redirect(to: Routes.user_path(conn, :index))
    end
  end
end
