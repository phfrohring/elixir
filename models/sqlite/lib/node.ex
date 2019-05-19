# This Source Code Form is subject to the terms of the Mozilla Public License,
# v2.0. If a copy of the MPL was not distributed with this file, You can obtain one
# at http://mozilla.org/MPL/2.0/.
#
# Copyright (c) 2018-2019 Contributors as noted in the AUTHORS file.
defmodule Sqlite do
  @moduledoc """

  ## Config

  `config/config.ex` tells where is the space on the fs that the database can use
  e.g. `priv/store.sqlite3`, which adapter to use e.g. `Sqlite.Ecto2` and which
  module should be used by `mix` to perform `ecto` related tasks like `migrations`
  i.e. `Sqlite.Store`.


  ## Sqlite.MixProject

  `{:sqlite_ecto2, "~> 2.4"}` in `deps` let this application interact with a `sqlite`
  database.


  ## Sqlite

  `GenServer` through which other application can send messages too to interact with
  the database.  Defines the messages it the application accepts.


  ## Sqlite.Actions

  Defines queries that the messages can perform on the database.


  ## Sqlite.Store

  `Ecto.Repo` that allows the application to interact with the `sqlite` database.


  ## Sqlite.Application

  Tells the supervisor to restart `Sqlite` and `Sqlite.Store` whenever necessary.


  ## Adding a set to the databse.

  Migration :≡ code specification of the database structure, independent from the db itself.

  Create a migration that the dev can fill up i.e. `mix ecto.gen.migration create_users`

  Apply the migrations to the database. i.e. `mix ecto.migrate`

  Verify the db structure i.e. `sqlite3 priv/store.sqlite3 .schema`


  ## Querying the database from the GenServer

  ```
  $ mix ecto.gen.migration create_users # update the migration file to add relevant fields.
  $ mix ecto.migrate
  $ iex -S mix
  iex(1)> Sqlite.Store.insert(%Sqlite.User{name: "jazzyb", email: "anonymous@example.com"})
  iex(1)> GenServer.call(Sqlite, :all_user_names)
  ["jazzyb"]
  ```


  ## A few useful commands:

  ```
    $ cd sqlite
    $ mix compile
    $ mix test
    $ mix format
    $ mix run
    $ mix help
    $ mix deps.get
    $ mix docs
  ```
  """

  use GenServer

  ## Client API

  def start_link(opts) do
    GenServer.start_link(__MODULE__, :arguments_for_init, name: Sqlite)
  end

  def all_user_names(server, msg) do
    GenServer.call(server, :all_user_names)
  end

  def echo_asynch(server, msg) do
    # Casts are asynchronous and the server won’t send a response back.
    GenServer.cast(server, {:echo_asynch, msg})
  end

  ## Server Callbacks

  def init(:arguments_for_init) do
    state = %{}
    {:ok, state}
  end

  def handle_call(:all_user_names, _msg_author_process, current_server_state) do
    {:ok, next_server_state, new_msg} = Sqlite.Actions.all_user_names(current_server_state, nil)
    {:reply, new_msg, next_server_state}
  end

  def handle_cast({:echo_asynch, msg}, current_server_state) do
    next_server_state = current_server_state
    {:noreply, next_server_state}
  end
end
