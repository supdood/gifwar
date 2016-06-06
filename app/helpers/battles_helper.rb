module BattlesHelper
	def text_with_images(text)
		regex = /https?:\/\/\S+\.(?:gif|jpg|jpeg|png|gifv)/i
		text.split(/(?<=\s)/).map do |match|
			if match.match(regex) 
				"<br>#{image_tag(match)}<br>"
			else
				html_escape(match)
			end
		end.join.html_safe
	end
end