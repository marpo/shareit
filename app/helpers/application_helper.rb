module ApplicationHelper
	def codeAnfaerben(code_snippet)
		CodeRay.scan(code_snippet, :ruby).div(:line_numbers => :table).html_safe
	end
	def wer
		User.find_by_id(session[:user_id]).name
	end
end
