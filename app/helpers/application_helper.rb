module ApplicationHelper
	def codeAnfaerben(code_snippet, sprache)
		uebergabe = sprache.to_sym
		CodeRay.scan(code_snippet, uebergabe).div(:line_numbers => :table)
	end
	def wer
		User.find_by_id(session[:user_id]).name
	end
end
