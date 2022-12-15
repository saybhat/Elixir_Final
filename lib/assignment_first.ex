import First.Task
import Ecto.Query
defmodule AssignmentFirst do

  def add(task) do
    add_task = %First.Task{task: task,status: "incomplete"}
  First.Repo.insert(add_task)
  end

  def len() do
    query = from task in First.Task ,
          select: task
    First.Repo.all(query)
  end
  def default() do
      First.Repo.insert_all(First.Task,[
        %{task: " ",status: " " },
        %{task: " ",status: " " },
        %{task: " ",status: " "},
        %{task: " ",status: " "},
        %{task: " ",status: " "},
        %{task: " ",status: " "},
        %{task: " ",status: " "}
      ])
  end

  def toggle_status(id,status) do
    old_task=First.Task |> First.Repo.get(id)
    if status=="complete" do
      old_task
      |> changeset(%{status: "incomplete"})
      |> First.Repo.update()
    else
      old_task
      |> changeset(%{status: "complete"})
      |> First.Repo.update()
    end
  end

  def update_task(id,task) do

    old_task=First.Task |> First.Repo.get(id)
    old_task
    |> changeset(%{task: task})
    |> First.Repo.update()

  end

  def display_task() do
    if length(len())==0 do
      default()
    end
    query = from task in First.Task ,
          order_by: [asc: :id],
          select: task
    data=First.Repo.all(query)
    tasks = data|> Enum.map(&(&1.task))
    Enum.take(tasks, -4) #|> IO.inspect(charlists: :as_lists)

  end
  def display_id() do
    if length(len())==0 do
      default()
    end
    query = from task in First.Task ,
          order_by: [asc: :id],
          select: task
    data=First.Repo.all(query)
    ids = data|> Enum.map(&(&1.id))
    Enum.take(ids, -4) #|> IO.inspect(charlists: :as_lists)

  end

  def changeset(task , params \\ %{}) do
    task
    |> Ecto.Changeset.cast(params , [:task,:status])
    |> Ecto.Changeset.validate_required([:task , :status])
  end



  def delete_task(id) do
    First.Task |> First.Repo.get(id)
    |> First.Repo.delete()

  end

  def display_status() do
    if length(len())==0 do
      default()
    end
    query = from task in First.Task ,
                 order_by: [asc: :id],
                 select: task
    data=First.Repo.all(query)
    statuses= data|> Enum.map(&(&1.status))
    Enum.take(statuses, -4) #|> IO.inspect(charlists: :as_lists)

  end




end
