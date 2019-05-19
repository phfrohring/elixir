# This Source Code Form is subject to the terms of the Mozilla Public License,
# v2.0. If a copy of the MPL was not distributed with this file, You can obtain one
# at http://mozilla.org/MPL/2.0/.
#
# Copyright (c) 2018-2019 Contributors as noted in the AUTHORS file.
# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :sqlite, Sqlite.Store,
  adapter: Sqlite.Ecto2,
  database: "priv/store.sqlite3"

config :sqlite, ecto_repos: [Sqlite.Store]
