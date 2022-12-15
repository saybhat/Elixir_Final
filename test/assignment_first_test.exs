defmodule AssignmentFirstTest do
  use ExUnit.Case
  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(First.Repo)
  end

  test "greets the world" do
    assert AssignmentFirst.hello() == :world
  end
end
