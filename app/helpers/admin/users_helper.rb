module Admin
  module UsersHelper
    def user_roles
     User.categories.keys.map.with_index do |ch,idx|
          [ch, idx]
      end
    end
  end
end