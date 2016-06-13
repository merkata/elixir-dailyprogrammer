defmodule Graph do
  def calculate_degrees(file) do
    file
    |>load_topology
    |>get_degrees
    |>output
  end

  def load_topology(file) do
    {:ok, binary} = File.read(file)
    [nodes | degrees] = String.strip(binary)
    |>String.split("\n")
    {nodes, degrees}
  end

  def get_degrees({nodes, degrees}) do
    get_degrees(nodes, degrees, [])
  end

  def get_degrees(nodes, [], keyword) do
    {nodes, keyword}
  end

  def get_degrees(nodes, [degree | degrees], keyword) do
    [node1, node2] = String.split(degree)
    t = Keyword.update(keyword, String.to_atom(node1), 1, &(&1 + 1))
    get_degrees(nodes, degrees, Keyword.update(t, String.to_atom(node2), 1, &(&1 + 1)))
  end

  def output({nodes, degrees}) do
    Enum.each(1..String.to_integer(nodes), fn node_name -> IO.puts "Node #{node_name} has degree #{degrees[Integer.to_string(node_name) |> String.to_atom]}" end)
  end
end
