defmodule First.Task do
  use Ecto.Schema

  schema "to_do" do
    field :task, :string
    field :status, :string
    #field :status, :boolean
  end

 

end
