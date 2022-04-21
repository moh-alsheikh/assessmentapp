# Seed roles

Role.find_or_create_by(name: 'Teachers')
Role.find_or_create_by(name: 'Students')

# Seed for the first user (teacher) in the system e.g teacher@example.com

teacher_role = Role.where(name: "Teachers").first_or_create
User.create_with(password: "12345678", role_id: teacher_role.id).first_or_create(email: "teacher@example.com")
    
