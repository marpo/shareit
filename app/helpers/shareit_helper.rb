module ShareitHelper
	def anzeigeButton obj
		begin
			obj.code
			link_to "Anzeigen", code_snippet_path(obj), :class => 'btn btn-mini btn-primary'
		rescue
			link_to "Anzeigen", link_path(obj), :class => 'btn btn-mini btn-primary'
		end
	end

	def code_snippet_hover obj
		if obj.kind_of? CodeSnippet
			p html_escape(codeAnfaerben(obj.code))
			content_tag(:h2, obj.titel, :class => "anzeige", :'data-content' => codeAnfaerben(obj.code))
			#rueckgabe = "<h2 class='anzeige' rel='popover' data-content='#{html_escape(codeAnfaerben(obj.code))}' data-original-title='A Title'>#{obj.titel}</h2>"
		else
		#	rueckgabe = "<h2>#{obj.titel}</h2>"
			content_tag(:h2, obj.titel)
		end
		#rueckgabe
	end

	def snippetsUndLinksKombinieren
		 @links = Link.all
 		 @code_snippets = CodeSnippet.all
 		 [@links, @code_snippets].flatten
	end
end
