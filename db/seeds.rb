user = User.new
user.name = "ADMINISTRADOR"
user.email = "admin@admin.com"
user.password = "123123"
user.password_confirmation = "123123"
user.profile = 0
user.save!