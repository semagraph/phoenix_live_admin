defmodule PhoenixLiveAdmin.MixProject do
  use Mix.Project

  @version = "0.1.0"

  def project do
    [
      app: :phoenix_live_admin,
      version: @version,
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
      package: package(),
      name: "LiveAdmin",
      docs: docs(),
      description: "Real-time admin dashboard for Phoenix",
      aliasas: aliases()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {Phoenix.LiveAdmin.Application, []},
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:phoenix_live_view, [github: "phoenixframework/phoenix_live_view"] ++ phoenix_live_view_tops()},
      {:phoenix_html, "~> 2.15"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:plug_cowboy, "~> 2.0", only: :dev},
      {:jason, "~> 1.0", only: [:dev, :test, :docs]},
      {:floki, "~> 0.27.0", only: :test},
      {:ex_doc, "~> 0.21", only: :docs},
    ]
  end

  defp phoenix_live_view_opts do
    if path = System.get_env("LIVE_VIEW_PATH") do
      [path: path]
    else
      []
    end
  end

  defp docs do
    [
      main: "Phoenix.LiveAdmin",
      source_ref: "v#{@version}",
      source_url: "https://github.com/semagraph/phoenix_live_admin",
      extra_section: "GUIDES",
      extras: extras(),
      nest_modules_by_prefix: [Phoenix.LiveAdmin]
    ]
  end

  defp extras do
    []
  end

  defp package do
    [
      maintainers: ["Tom K"],
      licenses: ["MIT"],
      links: %{github: "https://github.com/semagraph/phoenix_live_admin"},
      files: ~w(lib priv CHANGELOG.md LICENSE.md mix.exs README.md)
    ]
  end
end
