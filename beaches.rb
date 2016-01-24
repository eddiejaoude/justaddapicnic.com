require 'Mustache'
require 'Json'

class Beaches < Mustache
	#Need this page to set the template
	#https://github.com/mustache/mustache/blob/master/lib/mustache.rb
	self.template_file = "./templates/beaches.html"
	@@EmptyDataHash = {"BeachName"=>"EmptyBeach",
 				"BeachCSS"=>"./css/emptyBeach.css",
 				"BeachHeader"=>"This is an empty beach",
 				"Comments"=>
  					[{"Comment"=>"This is the first comment"}]}

	def loadJSONData jsonFilePath
		begin
			@LoadedDataHash = JSON.load(File.read(jsonFilePath))
		rescue StandardError => ex
			puts ex.message
		end
	end

	def beachTitle
		if @LoadedDataHash.nil? then
			return @@EmptyDataHash["BeachName"]
		else
			return @LoadedDataHash["BeachName"]
		end
	end

	def beachHeader
		if @LoadedDataHash.nil? then
			return @@EmptyDataHash["BeachHeader"]
		else
			return @LoadedDataHash["BeachHeader"]
		end

	end

	def comments
		if @LoadedDataHash.nil? then
			return @@EmptyDataHash["Comments"][0]
		else
			return @LoadedDataHash["Comments"]
		end
	end

	def beachCSS
		if @LoadedDataHash.nil? then
			return @@EmptyDataHash["beachCSS"]
		else
			return @LoadedDataHash["beachCSS"]
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
