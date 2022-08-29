module Jekyll
	module CustomFilters
		def week_date(input)
			return input if input.to_s.empty?
			time(input).strftime('%B %-d')
		end
		def kerning(input)
			# Keeping it here to share Markdown more easily.
			return input
		end
	end
end

Liquid::Template.register_filter(Jekyll::CustomFilters)
