# define a record, first attribute is considered the key
defrecord GameObject, id: 0, x: 0, y: 0

defmodule Database do
  def create_schema do
    create_table(GameObject)
  end

  def find(record, id) do
    :mnesia.read(record, id)
  end

  def write(object) do
    :mnesia.write(object)
  end

  # everything else ok to delete :)
  def delete(object) do
    :mnesia.delete_object(object)
  end

  defp create_table(record) do
    :mnesia.create_table(record, [{:attributes, Dict.keys(record.__record__(:fields))}])
  end
end
