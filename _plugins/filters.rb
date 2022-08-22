module Jekyll
	module CustomFilters
		def prepend_week(input)
			"Week #{ input.split('.').first }"
		end
		def prepend_project(input)
			"Project #{ input.split('.').first }"
		end
		def week_date(input)
			return input if input.to_s.empty?
			time(input).strftime('%B %-d')
		end
		def kerning_spans(input)
			letters = ""
			for letter in input.chars do
				if letter == " "
					letterClass = "space"
				elsif letter == " "
					letterClass = "nbsp"
				else
					letterClass = letter
				end
				letters += "<span class='#{ letterClass }'>#{ letter }</span>"
			end
			return letters
		end
	end
end

Liquid::Template.register_filter(Jekyll::CustomFilters)
