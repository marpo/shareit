module ShareitHelper
	def anzeigeButton obj
		begin
			obj.code
			link_to "Anzeigen", code_snippet_path(obj), :class => 'btn btn-mini btn-primary'
		rescue
			link_to "Anzeigen", link_path(obj), :class => 'btn btn-mini btn-primary'
		end
	end

	def linkPfad obj
		begin
			obj.code
			code_snippet_url(obj)
		rescue
			link_url(obj)
		end
	end

	def code_snippet_hover obj
		if obj.kind_of? CodeSnippet
			content_tag(:h2, obj.titel, :class => "anzeige", :'data-content' => codeAnfaerben(obj.code, obj.sprache))
		else
			content_tag(:h2, obj.titel)
		end
	end

	def beschreibung obj
		if obj.kind_of? CodeSnippet
			content_tag(:p, obj.beschreibung.truncate(80), :class => "beschreibung")
		else
			link_to obj.url, obj.url, :target => :_blank
		end
	end

	def snippetsUndLinksKombinieren
		 @links = Link.all
 		 @code_snippets = CodeSnippet.all
 		 [@links, @code_snippets].flatten
	end
end
