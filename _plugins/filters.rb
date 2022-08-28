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
					letter_class = "space"
				elsif letter == "\n"
					letter_class = false
				elsif letter == "*"
					letter_class = false
				elsif letter == " "
					letter_class = "nbsp"
				elsif letter == "-"
					letter_class = "hyphen"
				elsif letter == "–"
					letter_class = "ndash"
				elsif letter == "—"
					letter_class = "mdash"
				elsif letter == ","
					letter_class = "comma"
				elsif letter.to_i.to_s == letter
					letter_class = "num#{letter}"
				else
					letter_class = letter
				end
				if letter_class
					letters += "<span class='#{ letter_class }'>#{ letter }</span>"
				else
					if letter == "\n"
						letters += "<br>"
					else
						letters += letter
					end
				end
			end
			return letters
		end
	end
end

Liquid::Template.register_filter(Jekyll::CustomFilters)
