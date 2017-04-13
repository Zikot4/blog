class CallbacksController < Devise::OmniauthCallbacksController

	def all
		@user = User.from_omniauth(request.env["omniauth.auth"])
		@account = Account.from_omniauth(request.env["omniauth.auth"], @user.id)
		if User.find_by(email: @user.email).id == nil?
			sign_in_and_redirect @user
		else
			@user = User.find_by(email: @user.email)
			sign_in_and_redirect @user
		end
	end

	alias facebook all
	alias google_oauth2 all
	alias github all
end
