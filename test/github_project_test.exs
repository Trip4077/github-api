defmodule GithubProjectTest do
  use ExUnit.Case
  doctest GithubProject

  test "greets the world" do
    assert GithubProject.hello() == :world
  end
end
