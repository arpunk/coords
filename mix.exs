defmodule Coords.Mixfile do
  use Mix.Project

  def project do
    [app: :coords,
     version: "0.0.1",
     language: :lfe,
     description: "Generate random coordinates",
     package: package(),
     deps: deps()]
  end

  def application do
    [extra_applications: []]
  end

  defp deps do
    []
  end

  defp package do
    [files: ~w(src doc rebar.config README.md LICENSE),
     maintainers: ["Ricardo Lanziano"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/arpunk/coords"}]
  end
end
