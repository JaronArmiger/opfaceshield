# create admin user
user = User.new(email: "test@test.com",
			 password: "password",
			 password_confirmation: "password",
			 admin: true)
user.confirm
user.save!

Institution.create(name: "Medical")
Institution.create(name: "Essential Services")
Institution.create(name: "Physical Therapy/Occupational Therapy")
Institution.create(name: "Assisted Living and Memory Care")
Institution.create(name: "Community Mental Health")
Institution.create(name: "Other")

