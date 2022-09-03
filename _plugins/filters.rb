module Jekyll
	module CustomFilters
		def week_date(input)
			return input if input.to_s.empty?
			time(input).strftime('%B %-d')
		end
	end
end

Liquid::Template.register_filter(Jekyll::CustomFilters)
