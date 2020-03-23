defmodule Linebot.MixProject do
  use Mix.Project

  def project do
    [
      app: :linebot,
      description: "LINE Messaging API for Elixir",
      version: "0.1.0",
      elixir: "~> 1.10",
      package: package(),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      source_url: "https://github.com/elct9620/elixir-linebot"
    ]
  end

  def package() do
    [
      maintainers: ["Aotokitsuruya"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/elct9620/elixir-linebot"
      }
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    []
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:jason, "~> 1.2" },
      {:httpoison, "~> 1.6"}
    ]
  end
end
