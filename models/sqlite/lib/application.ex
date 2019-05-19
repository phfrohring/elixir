# This Source Code Form is subject to the terms of the Mozilla Public License,
# v2.0. If a copy of the MPL was not distributed with this file, You can obtain one
# at http://mozilla.org/MPL/2.0/.
#
# Copyright (c) 2018-2019 Contributors as noted in the AUTHORS file.
defmodule Sqlite.Application do
  use Application

  def start(_type, _args) do
    children = [
      Sqlite.Store,
      Sqlite
    ]

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
