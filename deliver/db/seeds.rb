User.create!(	name: 		"Kalle Anka",
				email: 		"kanka@ankeborg.se",
				password: 	"plm123!!",
				password_confirmation: "plm123!!",
				admin: true,
				activated: true,
				activated_at: Time.zone.now)

99.times do |n|
	name 		= Faker::Name.name
	email 		= "example-#{n+1}@railstutorial.org"
	password   	= "password"
	User.create!(	name:  					name,
					email: 					email,
					password: 				password,
					password_confirmation:  password,
					activated: true,
					activated_at: Time.zone.now)
end
