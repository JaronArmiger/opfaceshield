# create admin user
user = User.new(email: "test@test.com",
			 password: "password",
			 password_confirmation: "password",
			 admin: true)
user.confirm
user.save!

