module ShareitHelper
	def anzeigeButton obj
		begin
			obj.code
			link_to "Anzeigen", code_snippet_path(obj), :class => 'btn btn-mini btn-primary'
		rescue
			link_to "Anzeigen", link_path(obj), :class => 'btn btn-mini btn-primary'
		end
	end

	def snippetsUndLinksKombinieren
		 @links = Link.all
 		 @code_snippets = CodeSnippet.all
 		 [@links, @code_snippets].flatten
	end
end
