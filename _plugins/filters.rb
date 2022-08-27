module Jekyll
	module CustomFilters
		def week_date(input)
			return input if input.to_s.empty?
			time(input).strftime('%B %-d')
		end
		def kerning(input)
			return input if input.to_s.empty?
			letters = ""
			for letter in input.chars do
				if letter == " "
					letterClass = "space"
				elsif letter == "\n"
					letterClass = false
				elsif letter == " "
					letterClass = "nbsp"
				elsif letter == ","
					letterClass = "comma"
				elsif letter.to_i.to_s == letter
					letterClass = "num#{letter}"
				else
					letterClass = letter
				end
				if letterClass
					letters += "<span class='#{ letterClass }'>#{ letter }</span>"
				else
					letters += "<br>"
				end
			end
			return letters
		end
	end
end

Liquid::Template.register_filter(Jekyll::CustomFilters)
