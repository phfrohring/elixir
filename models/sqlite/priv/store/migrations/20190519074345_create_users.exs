# This Source Code Form is subject to the terms of the Mozilla Public License,
# v2.0. If a copy of the MPL was not distributed with this file, You can obtain one
# at http://mozilla.org/MPL/2.0/.
#
# Copyright (c) 2018-2019 Contributors as noted in the AUTHORS file.
defmodule Sqlite.Store.Migrations.CreateUsers do
  use Ecto.Migration

  def change do

    create table(:users) do
      add :name, :string
      add :email, :string
      timestamps()
    end

  end

end
