module Jekyll
	module CustomFilters
		def week_date(input)
			return input if input.to_s.empty?
			time(input).strftime('%B %-d')
		end
		def kerning_spans(input)
			return input if input.to_s.empty?
			letters = ""
			for letter in input.chars do
				if letter == "\n"
					letters += "<br>"
				else
					letters += letter
				end
			end
			return letters
		end
	end
end

Liquid::Template.register_filter(Jekyll::CustomFilters)
