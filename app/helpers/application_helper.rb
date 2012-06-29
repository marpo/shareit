module ApplicationHelper
	def codeAnfaerben(code_snippet)
		CodeRay.scan(code_snippet, :ruby).div(:line_numbers => :table).html_safe
	end
end
