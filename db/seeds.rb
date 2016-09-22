# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Add roles to the database if they don't already exist
ROLES = [{name: 'Admin'}, {name: 'Product Manager'}, {name: 'Content Manager'}].freeze

ROLES.each do |role|
  Role.create(role) if Role.find_by_name(role[:name]).blank?
end

# Add "Admin" role for all the existing Admin users
admin_role = Role.find_by_name('Admin')
User.all.each do |user|
  if user.isadmin?
    user.user_roles = [UserRole.create(user_id: user.id, role_id: admin_role.id)] unless admin_role.blank?
    user.save!  unless user.user_roles.blank?
  end
end
