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

	def loadJSONData jsonFilePath
		begin
			@LoadedDataHash = JSON.load(File.read(jsonFilePath))
		rescue StandardError => ex
			puts ex.message
		end
	end


	def compileToFile compileToFilePath
		$compiled = self.render(File.read(self.template_file, @@EmptyDataHash)
		begin
			File.write(compileToFilePath, $compiled)
		rescue StandardError => ex
			puts ex.message
		end
	end
end
