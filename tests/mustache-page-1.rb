require 'mustache'

class MustacheTempate1 < Mustache
	#Need this page to set the template
	#https://github.com/mustache/mustache/blob/master/lib/mustache.rb
	self.template_file = "./mustache-template-1.html"

	def pageTitle
		return "mustache-template-1.html"
	end

	def headerText
		return "A big hello world"
	end

	def comment
		return "This is a comment"
	end

	def css
		return "<style/>"
	end

end

puts MustacheTempate1.render()