# This Source Code Form is subject to the terms of the Mozilla Public License,
# v2.0. If a copy of the MPL was not distributed with this file, You can obtain one
# at http://mozilla.org/MPL/2.0/.
#
# Copyright (c) 2018-2019 Contributors as noted in the AUTHORS file.
defmodule SqliteTest do
  use ExUnit.Case, async: true

  test "echo_server msg" do
    assert GenServer.call(Sqlite, :all_user_names) == ["jazzyb"]
  end
end
