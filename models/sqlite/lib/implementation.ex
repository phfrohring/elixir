# This Source Code Form is subject to the terms of the Mozilla Public License,
# v2.0. If a copy of the MPL was not distributed with this file, You can obtain one
# at http://mozilla.org/MPL/2.0/.
#
# Copyright (c) 2018-2019 Contributors as noted in the AUTHORS file.
defmodule Sqlite.Store do
  @moduledoc """
  Represents the store i.e. the set of all elements.
  """

  use Ecto.Repo,
    otp_app: :sqlite,
    adapter: Sqlite.Ecto2
end

defmodule Sqlite.User do
  @moduledoc """
  Represents the set of users.
  """

  use Ecto.Schema

  schema "users" do
    field(:name, :string)
    field(:email, :string)
    timestamps()
  end
end

defmodule Sqlite.Actions do
  import Ecto.Query

  def all_user_names(state, msg) do
    {:ok, state, Sqlite.Store.all(Sqlite.User |> select([user], user.name))}
  end
end
