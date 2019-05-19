# This Source Code Form is subject to the terms of the Mozilla Public License,
# v2.0. If a copy of the MPL was not distributed with this file, You can obtain one
# at http://mozilla.org/MPL/2.0/.
#
# Copyright (c) 2018-2019 Contributors as noted in the AUTHORS file.

defmodule Sqlite.MixProject do
  use Mix.Project

  def project do
    [
      app: :sqlite,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps(),

      # Docs
      name: "Sqlite",
      source_url: "https://github.com/USER/PROJECT",
      homepage_url: "http://YOUR_PROJECT_HOMEPAGE",
      docs: [
        # The main page in the docs
        main: "Sqlite",
        # logo: "path/to/logo.png",
        markdown_processor: ExDoc.Markdown.Cmark
      ]
    ]
  end

  def application do
    [
      extra_applications: [:logger, :sqlite_ecto2, :ecto],
      mod: {Sqlite.Application, []}
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.20", only: :dev, runtime: false},
      {:cmark, "~> 0.7", only: :dev},
      {:sqlite_ecto2, "~> 2.4"}
      # {:app2, path: "../app2"}
    ]
  end
end
