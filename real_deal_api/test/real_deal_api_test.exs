defmodule RealDealApiTest do
  use ExUnit.Case
  doctest RealDealApi

  test "greets the world" do
    assert RealDealApi.hello() == :world
  end
end
