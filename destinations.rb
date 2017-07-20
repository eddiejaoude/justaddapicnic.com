require 'mustache'
require 'json'

class Destination < Mustache
  #Need this page to set the template
  #https://github.com/mustache/mustache/blob/master/lib/mustache.rb
  self.template_file = "./templates/JAAP_Destination_template.html"
  @@EmptyDataHash = {"Name"=>"EmptyBeach",
                     "CSS"=>"./css/emptyBeach.css",
                     "Header"=>"This is an empty beach",
                     "Comments"=>
                     [{"Comment"=>"This is the only comment"}]}
  

  @@EmptyDataHash.each do | pair |
    key=pair[0].to_sym
    val = pair[1]
    self[key] = val
  end

  def loadJSONData jsonFilePath
    begin
      @LoadedDataHash = JSON.load(File.read(jsonFilePath))
    rescue StandardError => ex
      puts ex.message
    end
  end


  def compileToFile compileToFilePath
    $compiled = self.render(File.read(self.template_file, @@EmptyDataHash))
    begin
      File.write(compileToFilePath, $compiled)
    rescue StandardError => ex
      puts ex.message
    end
  end
end


class Beaches < Mustache
  #Need this page to set the template
  #https://github.com/mustache/mustache/blob/master/lib/mustache.rb
  self.template_file = "./templates/beaches.html"
  @@EmptyDataHash = {"Name"=>"EmptyBeach",
                     "CSS"=>"./css/emptyBeach.css",
                     "Header"=>"This is an empty beach",
                     "Comments"=>
                     [{"Comment"=>"This is the only comment"}]}

  def loadJSONData jsonFilePath
    begin
      @LoadedDataHash = JSON.load(File.read(jsonFilePath))
    rescue StandardError => ex
      puts ex.message
    end
  end

  def beachTitle
    if @LoadedDataHash.nil? then
      return @@EmptyDataHash["Name"]
    else
      return @LoadedDataHash["Name"]
    end
  end

  def beachHeader
    if @LoadedDataHash.nil? then
      return @@EmptyDataHash["Header"]
    else
      return @LoadedDataHash["Header"]
    end

  end

  def comments
    if @LoadedDataHash.nil? then
      return @@EmptyDataHash["Comments"]
    else
      return @LoadedDataHash["Comments"]
    end
  end

  def beachMe
    return '<link rel="stylesheet" href="./empty.css"'
  end

  def beachCSS
    if @LoadedDataHash.nil? then
      return @@EmptyDataHash["CSS"]
    else
      return @LoadedDataHash["CSS"]
    end
  end

  def compileToFile compileToFilePath
    $compiled = self.render()
    begin
      File.write(compileToFilePath, $compiled)
    rescue StandardError => ex
      puts ex.message
    end
  end
end
