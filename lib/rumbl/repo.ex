defmodule Rumbl.Repo do
  # use Ecto.Repo, otp_app: :rumbl

  @doc """
  Dynamically loads the repository url from the
  DATABASE_URL environment variable.
  """
  # def init(_, opts) do
  #   {:ok, Keyword.put(opts, :url, System.get_env("DATABASE_URL"))}
  # end

  def all(Rumbl.User) do
    [%Rumbl.User{id: "1", name: "Sagar", username: "sagar", password: "elixir"},
     %Rumbl.User{id: "2", name: "Kartik", username: "kartik", password: "kartik"},
     %Rumbl.User{id: "3", name: "Chandu", username: "chandu", password: "chandu"},
     %Rumbl.User{id: "4", name: "Ashish", username: "ashish", password: "ashish"},
     %Rumbl.User{id: "5", name: "Pankaj", username: "pankaj", password: "pankaj"}]
  end
  def all(_module), do: []

  def get(module,id) do
    Enum.find all(module), fn map -> map.id == id end
  end

  def get_by(module, params) do
    Enum.find all(module), fn map ->
      Enum.all?(params, fn {key,val} -> Map.get(map,key) == val end)
    end  
  end
end
