require 'Mustache'
require 'Json'

class Beaches < Mustache
	#Need this page to set the template
	#https://github.com/mustache/mustache/blob/master/lib/mustache.rb
	self.template_file = "./templates/beaches.html"
	@DataHash = {"BeachName"=>"EmptyBeach",
 				"BeachCSS"=>"./css/emptyBeach.css",
 				"BeachHeader"=>"This is an empty beach",
 				"Comments"=>
  					[{"Comment"=>"This is the first comment"}]}

	def loadJSONData jsonFilePath
		begin
			@DataHash = JSON.load(File.read(jsonFilePath))
		rescue StandardError => ex
			puts ex.message
		end
	end

	def pageTitle
		return "EmptyBeach"
		#return @DataHash["BeachName"]
	end

	def headerText
		return "This is an empty beach"
		#return @DataHash["BeachHeader"]
	end

	#def comments
#		return {"Comment"=>"This is the first comment"}
		#return @DataHash["Comments"]
#	end

	def css
		return "./css/emptyBeach.css"
		#return @DataHash["BeachCss"]
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

puts Beaches.render()
