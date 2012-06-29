module ShareitHelper
	def anzeigeButton obj
		begin
			obj.code
			link_to "Anzeigen", code_snippet_path(obj), :class => 'btn btn-mini btn-primary'
		rescue
			link_to "Anzeigen", link_path(obj), :class => 'btn btn-mini btn-primary'
		end
	end
end
