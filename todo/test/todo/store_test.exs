defmodule Todo.StoreTest do
  use Todo.DataCase

  alias Todo.Store

  describe "books" do
    alias Todo.Store.Book

    @valid_attrs %{"\"": "some \""}
    @update_attrs %{"\"": "some updated \""}
    @invalid_attrs %{"\"": nil}

    def book_fixture(attrs \\ %{}) do
      {:ok, book} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Store.create_book()

      book
    end

    test "list_books/0 returns all books" do
      book = book_fixture()
      assert Store.list_books() == [book]
    end

    test "get_book!/1 returns the book with given id" do
      book = book_fixture()
      assert Store.get_book!(book.id) == book
    end

    test "create_book/1 with valid data creates a book" do
      assert {:ok, %Book{} = book} = Store.create_book(@valid_attrs)
      assert book." == "some \""
    end

    test "create_book/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Store.create_book(@invalid_attrs)
    end

    test "update_book/2 with valid data updates the book" do
      book = book_fixture()
      assert {:ok, %Book{} = book} = Store.update_book(book, @update_attrs)
      assert book." == "some updated \""
    end

    test "update_book/2 with invalid data returns error changeset" do
      book = book_fixture()
      assert {:error, %Ecto.Changeset{}} = Store.update_book(book, @invalid_attrs)
      assert book == Store.get_book!(book.id)
    end

    test "delete_book/1 deletes the book" do
      book = book_fixture()
      assert {:ok, %Book{}} = Store.delete_book(book)
      assert_raise Ecto.NoResultsError, fn -> Store.get_book!(book.id) end
    end

    test "change_book/1 returns a book changeset" do
      book = book_fixture()
      assert %Ecto.Changeset{} = Store.change_book(book)
    end
  end

  describe "users" do
    alias Todo.Store.User

    @valid_attrs %{"\"": "some \""}
    @update_attrs %{"\"": "some updated \""}
    @invalid_attrs %{"\"": nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Store.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Store.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Store.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Store.create_user(@valid_attrs)
      assert user." == "some \""
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Store.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Store.update_user(user, @update_attrs)
      assert user." == "some updated \""
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Store.update_user(user, @invalid_attrs)
      assert user == Store.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Store.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Store.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Store.change_user(user)
    end
  end

  describe "data" do
    alias Todo.Store.Data

    @valid_attrs %{"\"": "some \""}
    @update_attrs %{"\"": "some updated \""}
    @invalid_attrs %{"\"": nil}

    def data_fixture(attrs \\ %{}) do
      {:ok, data} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Store.create_data()

      data
    end

    test "list_data/0 returns all data" do
      data = data_fixture()
      assert Store.list_data() == [data]
    end

    test "get_data!/1 returns the data with given id" do
      data = data_fixture()
      assert Store.get_data!(data.id) == data
    end

    test "create_data/1 with valid data creates a data" do
      assert {:ok, %Data{} = data} = Store.create_data(@valid_attrs)
      assert data." == "some \""
    end

    test "create_data/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Store.create_data(@invalid_attrs)
    end

    test "update_data/2 with valid data updates the data" do
      data = data_fixture()
      assert {:ok, %Data{} = data} = Store.update_data(data, @update_attrs)
      assert data." == "some updated \""
    end

    test "update_data/2 with invalid data returns error changeset" do
      data = data_fixture()
      assert {:error, %Ecto.Changeset{}} = Store.update_data(data, @invalid_attrs)
      assert data == Store.get_data!(data.id)
    end

    test "delete_data/1 deletes the data" do
      data = data_fixture()
      assert {:ok, %Data{}} = Store.delete_data(data)
      assert_raise Ecto.NoResultsError, fn -> Store.get_data!(data.id) end
    end

    test "change_data/1 returns a data changeset" do
      data = data_fixture()
      assert %Ecto.Changeset{} = Store.change_data(data)
    end
  end
end
