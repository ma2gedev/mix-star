defmodule MixStar.Mixfile do
  use Mix.Project

  def project do
    [ app: :mixstar,
      name: "MixStar",
      version: "0.0.1",
      elixir: "~> 1.0.0",
      package: [
        contributors: ["Takayuki Matsubara"],
        licenses: ["MIT"],
        links: %{"GitHub" => "https://github.com/ma2gedev/mix-star"}
       ],
      description: "MixStar starred GitHub repository that depends on your project",
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [
      applications: []
    ]
  end

  # Returns the list of dependencies in the format:
  # { :foobar, git: "https://github.com/elixir-lang/foobar.git", tag: "0.1" }
  #
  # To specify particular versions, regardless of the tag, do:
  # { :barbat, "~> 0.1", github: "elixir-lang/barbat.git" }
  defp deps do
    [
      { :netrc, "~> 0.0.1" },
      { :ex_doc, "~> 0.6", only: :dev }
    ]
  end
end
