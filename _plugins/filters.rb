module Jekyll
	module CustomFilters
		def week_number(input)
			"Week #{ input.split('.').first }"
		end
	end
end

Liquid::Template.register_filter(Jekyll::CustomFilters)
