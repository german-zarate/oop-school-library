require 'json'

class HandleData
  def initialize(filename)
    @filename = "#{filename}.json"
  end

  def read
    data = File.read(@filename)
    JSON.parse(data)
  end

  def write(data)
    json = JSON.generate(data)
    File.write(@filename, json)
  end
end
