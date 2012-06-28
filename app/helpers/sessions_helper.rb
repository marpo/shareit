module SessionsHelper
	def werda
		if User.find_by_id(session[:user_id])
			u = User.find_by_id(session[:user_id]).name
			loginOderLogout(u)
		else
			loginOderLogout("Login")
		end
	end

	def loginOderLogout(dername)
		if dername == "Login"
			link_to "Login", login_path, :method => :get, :class => 'btn btn-mini btn-primary'
		else
			link_to dername, logout_path, :method => :delete, :class => 'btn btn-mini btn-primary'
		end
	end
end
