module DataInputHelper
  def data_input
    path = File.join(File.dirname(__FILE__), '../../db/input.json')
    JSON.parse(File.read(path))
  end
end
